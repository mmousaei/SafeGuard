#include <ros/ros.h>
// PCL specific includes
#include <sensor_msgs/PointCloud2.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/point_cloud.h>
#include <pcl/point_types.h>
#include <pcl/conversions.h>
#include <pcl_ros/transforms.h>
#include <pcl/filters/voxel_grid.h>

#include <pcl/ModelCoefficients.h>
#include <pcl/io/pcd_io.h>
#include <pcl/filters/extract_indices.h>
#include <pcl/filters/passthrough.h>
#include <pcl/features/normal_3d.h>
#include <pcl/sample_consensus/method_types.h>
#include <pcl/sample_consensus/model_types.h>
#include <pcl/segmentation/sac_segmentation.h>
#include <pcl/visualization/cloud_viewer.h>
#include "std_msgs/Byte.h"
#include "std_msgs/Bool.h"
#include "std_msgs/Int8.h"
#include <math.h>
#include "pointcloud_process.h"
#include "msg/safeguard.h"
#include <sensor_msgs/TimeReference.h>



typedef pcl::PointXYZ PointT;

ros::Publisher pub;
ros::Publisher processed_info;
ros::Publisher distance;
pcl_processor::safeguard output_topic;
double max_margin = 3;

//void  time_callback(const sensor_msgs::TimeReferenceConstPtr& time)
//{
//    output_topic.time.nsec = time->time_ref.nsec;
//    output_topic.time.sec = time->time_ref.sec;
//    processed_info.publish(output_topic);
//}

#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define MIN(a, b) ((a) < (b) ? (a) : (b))

void cloud_cb (const sensor_msgs::PointCloud2ConstPtr& input)
{

  // All the objects needed
    pcl::SACSegmentationFromNormals<PointT, pcl::Normal> seg;
    pcl::ExtractIndices<PointT> extract;
    pcl::ExtractIndices<pcl::Normal> extract_normals;
    pcl::PointCloud<PointT>::Ptr cloud_filtered (new pcl::PointCloud<PointT>);
    pcl::PointCloud<pcl::Normal>::Ptr cloud_normals (new pcl::PointCloud<pcl::Normal>);
    pcl::PointCloud<PointT>::Ptr cloud_obstacles (new pcl::PointCloud<PointT>);
    pcl::PointCloud<pcl::Normal>::Ptr cloud_normals2 (new pcl::PointCloud<pcl::Normal>);
    pcl::ModelCoefficients::Ptr coefficients_plane (new pcl::ModelCoefficients), coefficients_cylinder (new pcl::ModelCoefficients);
    pcl::PointIndices::Ptr inliers_plane (new pcl::PointIndices), inliers_cylinder (new pcl::PointIndices);
    pointcloud_process my_process;


//// Convert to PCL data type

    pcl::PointCloud<PointT>::Ptr cloud (new pcl::PointCloud<PointT>);
    cloud = my_process.convert_msgs_to_pcl(input);
    std::cerr << "PointCloud has: " << cloud->points.size () << " data points." << std::endl;
//// Build a passthrough filter to remove spurious NaNs

    cloud_filtered = my_process.range_filter(cloud, 0.5, MAX(max_margin, 0.7));
//    cloud_filtered = cloud;
    std::cerr << "PointCloud after filtering has: " << cloud_filtered->points.size () << " data points." << std::endl;


//// Estimate point normals

    cloud_normals = my_process.estimate_normals(cloud_filtered);

    std::cerr << "The filtered cloud size is " << cloud_filtered->size() << "and the normals size is " << cloud_normals->size()<<std::endl;

if(!cloud_normals->empty())
{

//// Create the segmentation object for cylinder segmentation and set all the parameters

    seg.setOptimizeCoefficients (true);
    seg.setModelType (pcl::SACMODEL_CYLINDER);
    seg.setMethodType (pcl::SAC_RANSAC);
    seg.setNormalDistanceWeight (0.5);
    seg.setMaxIterations (10000);
    seg.setDistanceThreshold (0.3);
    seg.setRadiusLimits (0.3, 0.6); //for small pipe
    // seg.setRadiusLimits (0.45, 0.65); //for big pipe
    seg.setInputCloud (cloud_filtered);
    seg.setInputNormals (cloud_normals);

    // Obtain the cylinder inliers and coefficients
    seg.segment (*inliers_cylinder, *coefficients_cylinder); //TODO: This is the line where program crashes at the open end pipe (when there is no cylinder)
    std::cerr << "Cylinder coefficients: " << *coefficients_cylinder << std::endl;

//// Estimate the angular offset

    pointcloud_process::angle_3d angle3d;
    angle3d = my_process.estimate_angular_offset(*coefficients_cylinder);
    std::cerr << "roll = " << angle3d.roll<< std::endl;
    std::cerr << "pitch = " << angle3d.pitch<< std::endl;
    std::cerr << "yaw = " << angle3d.yaw<< std::endl;
    output_topic.oriX = angle3d.yaw-90;
    output_topic.oriY = angle3d.pitch-90;
    output_topic.oriZ = angle3d.roll;

//// Estimate the center offset

    pcl::ModelCoefficients& coefficients_vals = *coefficients_cylinder;
    pointcloud_process::line_3d axis_line;
    axis_line.point.x = coefficients_vals.values[0];
    axis_line.point.y = coefficients_vals.values[1];
    axis_line.point.z = coefficients_vals.values[2];
    axis_line.vector.x = coefficients_vals.values[3];
    axis_line.vector.y = coefficients_vals.values[4];
    axis_line.vector.z = coefficients_vals.values[5];
    pointcloud_process::point_3d center_at_zero;

    center_at_zero = my_process.estimate_center_at_zero(axis_line);
    output_topic.placX = center_at_zero.x;
    output_topic.placY = 10;
//    output_topic.placZ = center_at_zero.z;
    output_topic.placZ = 10+20;

    std::cerr << "The center offset from the LiDAR coordinate is : [ " << center_at_zero.x << ", " << center_at_zero.y << ", " << center_at_zero.z << " ]" << std::endl;

//// Extract the inliers from the input cloud
    extract.setInputCloud (cloud_filtered);
    extract.setIndices (inliers_cylinder);
    extract.setNegative (false);

    pcl::PointCloud<PointT>::Ptr cloud_cylinder (new pcl::PointCloud<PointT> ());
    extract.filter (*cloud_cylinder);
    if (cloud_cylinder->points.empty ())
        std::cerr << "Can't find the cylindrical component." << std::endl;
    else
    {
        std::cerr << "PointCloud representing the cylindrical component: " << cloud_cylinder->points.size () << " data points." << std::endl;
    }



//// Remove the cylinder inliers, extract the rest (cloud_obstacle)

    extract.setNegative (true);
    extract.filter (*cloud_obstacles);
    extract_normals.setNegative (true);
    extract_normals.setInputCloud (cloud_normals);
    extract_normals.setIndices (inliers_cylinder);
    extract_normals.filter (*cloud_normals);


//// Remove beginning range from obstacle cloud

//    cloud_obstacles = my_process.range_filter(cloud_obstacles, 0.5, MAX(max_margin, 0.7));
//    // First time max-margin initiation
//    int cnt_fmm = 0;
//    if(!cnt_fmm)
//    {
//        cnt_fmm++;
//        max_margin = my_process.scan_for_eop_forward(cloud_cylinder, 3, axis_line);
//    }



//// Find Min/Max/Ave Obstacle and Cylinder

    double obstacle_min, obstacle_max, obstacle_ave, cylinder_min, cylinder_max, cylinder_ave;
    obstacle_min = my_process.find_first_cloud(cloud_obstacles);
    obstacle_max = my_process.find_last_cloud(cloud_obstacles);
    obstacle_ave = my_process.find_average_cloud(cloud_obstacles);

    cylinder_min = my_process.find_first_cloud(cloud_cylinder);
    cylinder_max = my_process.find_last_cloud(cloud_cylinder);
    cylinder_ave = my_process.find_average_cloud(cloud_cylinder);

    // LEGEND: decisions: 0 = safe, 1 = obstacle, 2 = open, 3 = close

    double max_margin_temp, max_margin_temp2;
    bool eop = 0;

    max_margin_temp = my_process.scan_for_eop_backwards(cloud_cylinder, max_margin, axis_line);
    max_margin_temp2 = my_process.scan_for_eop_forward(cloud_cylinder, max_margin, axis_line);


    std::cerr<<"THE EOP SCAN RESULT ISSSSSSSSSSSSSSSSSSSSSSSS: " << max_margin_temp << std::endl;
    if(max_margin_temp < 2.98)
    {
        max_margin = MAX(max_margin_temp, max_margin_temp);
        eop = true;
    }
    if(obstacle_max < max_margin)
    {
        pointcloud_process::point_2d center;
        center = my_process.estimate_cylinder_center_at_Z(axis_line, obstacle_min);
        output_topic.decision = my_process.safeguard_decision_maker(cloud_obstacles, center, cloud_cylinder->points.size());
        output_topic.distance = obstacle_min;
    }
    else if(eop)
    {
        if(obstacle_max < max_margin + 0.08 && obstacle_max > max_margin - 0.08)
        {
            output_topic.decision = 3;
            output_topic.distance = max_margin;
        }
        else
        {
            output_topic.decision = 2;
            output_topic.distance = max_margin;
        }
    }
    processed_info.publish(output_topic);

    //// Filter the obstacle cloud

    //cloud_obstacles = my_process.range_filter(cloud_obstacles, 0.9, 1.15);


//// Convert to ROS data type

    sensor_msgs::PointCloud2 output;
    output = my_process.convert_pcl_to_msgs(cloud_cylinder);
    pub.publish (output);

} else{
    //TODO: have all of the angles and everything from previous estimations
    std::cerr<<"IM OOOOUUUUUUT OF IIIIIIIIIIIIIIIIIIIIFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF"<<std::endl;
    output_topic.decision = 2;
    output_topic.distance = 0;
}





//
////// Estimate Open/Closed pipe
//
//    int open_closed_decision;
//    pointcloud_process::decision_distance decision_distance;
//    decision_distance = my_process.decision_distance_estimatie(0.7, 0.1, cloud_filtered->size(), cloud_cylinder->size(), cloud_obstacles, cloud_cylinder);
//
////    std::cerr << "dissssssssssssssssssssssssssssstance: "<<decision_distance.distance << std::endl;
//    if(decision_distance.decision == pointcloud_process::safe)
//    {
////        std::cerr << "SAAAAAAAAAAFE" << std::endl;
//        output_topic.decision = 0;
//        output_topic.distance = 3;
//    }
//    else
//    {
//        if(decision_distance.decision == pointcloud_process::obstacle)
//        {
////            std::cerr << "OBSTACLEEEEEEEEEE" << std::endl;
//            output_topic.decision = 1;
//            pointcloud_process::point_2d center, center2;
//            center = my_process.estimate_cylinder_center_average(cloud_cylinder);
////            center2 = my_process.estimate_cylinder_center_at_Z(axis_line, 1.5);
//            std::cerr << "The center of the cylinder is located at the point with x = " << center.x << " and y = " << center.y <<std::endl;
////            std::cerr << "The center2 of the cylinder is located at the point with x = " << center2.x << " and y = " << center2.y <<std::endl;
//
//            int tmp = output_topic.decision;
//            std::cerr << "Is it not safe to continue going forward : " << tmp <<std::endl;
//            std::cerr << "There are "<< cloud_obstacles->points.size() << " points in the obstacle segment" <<std::endl;
//
//            output_topic.decision = my_process.safeguard_decision_maker(cloud_obstacles, center, cloud_cylinder->points.size());
//            output_topic.distance = decision_distance.distance;
//        }
//        else if(decision_distance.decision == pointcloud_process::close)
//        {
////            std::cerr << "CLOOOOOOOOOOOOOOOOOSE" << std::endl;
//            output_topic.decision = 2;
//            output_topic.distance = decision_distance.distance;
//        }
//        else if(decision_distance.decision == pointcloud_process::open)
//        {
////            std::cerr << "OOOOOOOOOOOOOOOOOOOOOPPPPPPEN" << std::endl;
//            output_topic.decision = 3;
//            output_topic.distance = decision_distance.distance;
//        }
//    }
//
//
//    std::cerr << "There decision is: "<< output_topic.decision << " the distance is: " << output_topic.distance <<std::endl;
//
//
//    processed_info.publish(output_topic);
//











}

int main (int argc, char** argv)
{
  // Initialize ROS
  ros::init (argc, argv, "pcl_subscriber");
  ros::NodeHandle nh;

  pointcloud_process my_process;

  // Create a ROS subscriber for the input point cloud
  ros::Subscriber sub = nh.subscribe ("/sick_visionary_t_driver/points", 5, cloud_cb);
  //ros::Subscriber time_refrence = nh.subscribe("imu/time_refrence", 1, time_callback);
  // Create a ROS publisher for the output point cloud
  pub = nh.advertise<sensor_msgs::PointCloud2> ("output3", 1);
  processed_info = nh.advertise<pcl_processor::safeguard> ("processed/info", 1);
  distance = nh.advertise<std_msgs::Int8> ("distance", 1);


  // Spin
  ros::spin ();
}