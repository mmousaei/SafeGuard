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

typedef pcl::PointXYZ PointT;

ros::Publisher pub;
ros::Publisher decision;
ros::Publisher distance;

void cloud_cb (const sensor_msgs::PointCloud2ConstPtr& input)
{

  // All the objects needed
  pcl::PCDReader reader;
  pcl::PassThrough<PointT> pass;
  pcl::NormalEstimation<PointT, pcl::Normal> ne;
  pcl::SACSegmentationFromNormals<PointT, pcl::Normal> seg; 
  pcl::PCDWriter writer;
  pcl::ExtractIndices<PointT> extract;
  pcl::ExtractIndices<pcl::Normal> extract_normals;
  pcl::search::KdTree<PointT>::Ptr tree (new pcl::search::KdTree<PointT> ());

  pcl::PointCloud<PointT>::Ptr cloud_filtered (new pcl::PointCloud<PointT>);
  pcl::PointCloud<pcl::Normal>::Ptr cloud_normals (new pcl::PointCloud<pcl::Normal>);
  pcl::PointCloud<PointT>::Ptr cloud_obstacles (new pcl::PointCloud<PointT>);
  pcl::PointCloud<pcl::Normal>::Ptr cloud_normals2 (new pcl::PointCloud<pcl::Normal>);
  pcl::ModelCoefficients::Ptr coefficients_plane (new pcl::ModelCoefficients), coefficients_cylinder (new pcl::ModelCoefficients);
  pcl::PointIndices::Ptr inliers_plane (new pcl::PointIndices), inliers_cylinder (new pcl::PointIndices);


  // Convert to PCL data type
  pcl::PCLPointCloud2* cloud_temp = new pcl::PCLPointCloud2; 
  pcl::PCLPointCloud2ConstPtr cloudPtr(cloud_temp);
  pcl_conversions::toPCL(*input, *cloud_temp);
  pcl::PointCloud<PointT>::Ptr cloud (new pcl::PointCloud<PointT>);
  pcl::fromPCLPointCloud2(*cloud_temp, *cloud);
  // pcl::PCLPointCloud2 cloud_filtered;



  std::cerr << "PointCloud has: " << cloud->points.size () << " data points." << std::endl;

  //... visualize cloud
   // pcl::visualization::CloudViewer viewer ("Simple Cloud Viewer");
   // viewer.showCloud (cloud);
   // while (!viewer.wasStopped ())
   // {
   // }

  // Build a passthrough filter to remove spurious NaNs
  pass.setInputCloud (cloud);
  pass.setFilterFieldName ("z");
  // pass.setFilterLimits (.9, 1.5);
  pass.setFilterLimits (1.9, 2);
  pass.filter (*cloud_filtered);
  std::cerr << "PointCloud after filtering has: " << cloud_filtered->points.size () << " data points." << std::endl;
  // Estimate point normals
  ne.setSearchMethod (tree);
  ne.setInputCloud (cloud_filtered);
  ne.setKSearch (50);
  ne.compute (*cloud_normals);

  // // Create the segmentation object for the planar model and set all the parameters
  // seg.setOptimizeCoefficients (true);
  // seg.setModelType (pcl::SACMODEL_NORMAL_PLANE);
  // seg.setNormalDistanceWeight (0.1);
  // seg.setMethodType (pcl::SAC_RANSAC);
  // seg.setMaxIterations (100);
  // seg.setDistanceThreshold (0.03);
  // seg.setInputCloud (cloud_filtered);
  // seg.setInputNormals (cloud_normals);
  // // Obtain the plane inliers and coefficients
  // seg.segment (*inliers_plane, *coefficients_plane);
  // std::cerr << "Plane coefficients: " << *coefficients_plane << std::endl;

  // // Extract the planar inliers from the input cloud
  // extract.setInputCloud (cloud_filtered);
  // extract.setIndices (inliers_plane);
  // extract.setNegative (false);

  // // Write the planar inliers to disk
  // pcl::PointCloud<PointT>::Ptr cloud_plane (new pcl::PointCloud<PointT> ());
  // extract.filter (*cloud_plane);
  // std::cerr << "PointCloud representing the planar component: " << cloud_plane->points.size () << " data points." << std::endl;
  // writer.write ("table_scene_mug_stereo_textured_plane.pcd", *cloud_plane, false);

  // // Remove the planar inliers, extract the rest
  // extract.setNegative (true);
  // extract.filter (*cloud_obstacles);
  // extract_normals.setNegative (true);
  // extract_normals.setInputCloud (cloud_normals);
  // extract_normals.setIndices (inliers_plane);
  // extract_normals.filter (*cloud_normals2);

  // Create the segmentation object for cylinder segmentation and set all the parameters
  seg.setOptimizeCoefficients (true);
  seg.setModelType (pcl::SACMODEL_CYLINDER);
  seg.setMethodType (pcl::SAC_RANSAC);
  seg.setNormalDistanceWeight (0.2);
  seg.setMaxIterations (10000);
  seg.setDistanceThreshold (0.2);
  seg.setRadiusLimits (0.3, 0.5);
  seg.setInputCloud (cloud_filtered);
  seg.setInputNormals (cloud_normals);

  // Obtain the cylinder inliers and coefficients
  seg.segment (*inliers_cylinder, *coefficients_cylinder);
  std::cerr << "Cylinder coefficients: " << *coefficients_cylinder << std::endl;


  // Extract the planar inliers from the input cloud
  extract.setInputCloud (cloud_filtered);
  extract.setIndices (inliers_cylinder);
  extract.setNegative (false);


  // Write the cylinder inliers to disk
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
    writer.write ("table_scene_mug_stereo_textured_cylinder.pcd", *cloud_cylinder, false);
  }


  // Remove the cylinder inliers, extract the rest
  extract.setNegative (true);
  extract.filter (*cloud_obstacles);
  extract_normals.setNegative (true);
  extract_normals.setInputCloud (cloud_normals);
  extract_normals.setIndices (inliers_cylinder);
  extract_normals.filter (*cloud_normals);



  // Convert to ROS data type
  sensor_msgs::PointCloud2 output;
  // pcl::PCLPointCloud2* cloud_temp2 = new pcl::PCLPointCloud2; 
  // pcl::PCLPointCloud2ConstPtr cloudPtr(cloud_temp2);
  pcl::toPCLPointCloud2(*cloud_cylinder, *cloud_temp);
  pcl_conversions::fromPCL(*cloud_temp, output);
  // pcl::toROSMsg(output, cloud_cylinder);
  // Publish the data
  pub.publish (output);

  double radius = .25;
  double dist;
  bool notSafe = false;
  double sum = 0;
  double xcenter = 0;
  double ycenter = 0;
  // for(int i = 0; i < cloud_cylinder->points.size(); i++)
  // {
  //   xcenter += cloud_cylinder->points[i].x;
  //   ycenter += cloud_cylinder->points[i].y;
  // }

  // xcenter /= cloud_cylinder->points.size();
  // ycenter /= cloud_cylinder->points.size();

  xcenter = 0.1;
  ycenter = -0.19;


  std::cerr << "The center of the cylinder is located at the point with x = " << xcenter << " and y = " << ycenter <<std::endl;


  for(int i = 0; i < cloud_obstacles->points.size(); i++)
  {
    dist = ( (cloud_obstacles->points[i].x - xcenter) * (cloud_obstacles->points[i].x - xcenter) ) + ( (cloud_obstacles->points[i].x - xcenter) * (cloud_obstacles->points[i].x - xcenter) );

    sum += dist;
    
    if ( dist < radius*radius )
    {
      notSafe = true;
      // std::cerr << "The distance squared of the point to the origin is " << dist << " meters and the radius squared is " << radius*radius <<std::endl;
      // distance.data = dist;
    }      
  }
  sum /= cloud_obstacles->points.size();
  std::cerr << "The average of points radius squared is : " << sum <<std::endl;
  std::cerr << "Is it not safe to continue going forward : " << notSafe <<std::endl;
  std::cerr << "There are "<< cloud_obstacles->points.size() << " points in the obstacle segment" <<std::endl;

  // decision = notSafe;
  // pub.publish(decision);
  // pub.publish(distance);
}

int main (int argc, char** argv)
{
  // Initialize ROS
  ros::init (argc, argv, "pcl_subscriber");
  ros::NodeHandle nh;

  // Create a ROS subscriber for the input point cloud
  ros::Subscriber sub = nh.subscribe ("/sick_visionary_t_driver/points", 1, cloud_cb);

  // Create a ROS publisher for the output point cloud
  pub = nh.advertise<sensor_msgs::PointCloud2> ("output", 1);
  decision = nh.advertise<std_msgs::Bool> ("decision", 1);
  distance = nh.advertise<std_msgs::Byte> ("distance", 1);

  // Spin
  ros::spin ();
}