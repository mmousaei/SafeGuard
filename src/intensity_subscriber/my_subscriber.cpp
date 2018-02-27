#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <opencv2/highgui/highgui.hpp>
#include <cv_bridge/cv_bridge.h>
#include <stdio.h>
#include "opencv2/features2d.hpp"
#include "opencv2/xfeatures2d.hpp"

using namespace cv::xfeatures2d;


image_transport::Publisher pub;


void imageCallback(const sensor_msgs::ImageConstPtr& msg)
{

  cv_bridge::CvImagePtr my_img = cv_bridge::toCvCopy(msg, "16UC1");
  // cv::imshow("edge_canny", my_img->image);

  cv::Mat img = my_img->image;
  // my_img->image.convertTo(my_img->image, CV_64F);
  //my_img->image = my_img->image/255.0;
  // pow(my_img->image, 0.5, my_img->image);
  //my_img->image = my_img->image*255.0;
  cv::flip(my_img->image*1.2, my_img->image, -1);

  pub.publish(my_img->toImageMsg());

  
  // try
  // {
  //   cv::Mat my_img = cv_bridge::toCvCopy(msg, "16UC1")->image;
    
  //   int lowThreshold = 80;
  //   //my_img = my_img;
  //   //my_img.convertTo(my_img, CV_8U, 0.2);
  //   // cv::imshow("view", my_img*15);
  //   double min;
  //   double max;
  //   minMaxLoc(my_img, &min, &max);
    
  //   my_img.convertTo(my_img, CV_16UC1);

  //   cv::Mat close_cut = cv::Mat::zeros(my_img.size(), CV_16UC1);
  //   cv::Mat medium_cut = cv::Mat::zeros(my_img.size(), CV_16UC1);
  //   cv::Mat far_cut = cv::Mat::zeros(my_img.size(), CV_16UC1);

  //   int max_ilum = 52000;
  //   int low = 1000;
  //   int medium = 2000;
  //   int high = 10000;
  //   for(int i = 0; i < my_img.rows; i++)
  //   {
  //     for(int j = 0; j < my_img.cols; j++)
  //     {
  //       if(my_img.at<uint16_t>(cv::Point(j, i)) > 0 && my_img.at<uint16_t>(cv::Point(j, i)) < low)
  //       {
  //         close_cut.at<uint16_t>(cv::Point(j, i)) = my_img.at<uint16_t>(cv::Point(j, i)); 
  //       }
  //       else
  //       {
  //         close_cut.at<uint16_t>(cv::Point(j, i)) = max_ilum;
  //       }
  //       if(my_img.at<uint16_t>(cv::Point(j, i)) > low && my_img.at<uint16_t>(cv::Point(j, i)) < medium)
  //       {
  //         medium_cut.at<uint16_t>(cv::Point(j, i)) = my_img.at<uint16_t>(cv::Point(j, i)); 
  //       }
  //       else
  //       {
  //         medium_cut.at<uint16_t>(cv::Point(j, i)) = max_ilum;
  //       }
  //       if(my_img.at<uint16_t>(cv::Point(j, i)) > medium)
  //       {
  //         far_cut.at<uint16_t>(cv::Point(j, i)) = my_img.at<uint16_t>(cv::Point(j, i)); 
  //       }
  //       else
  //       {
  //         far_cut.at<uint16_t>(cv::Point(j, i)) = 42000;
  //       }
  //     }
  //   }
  //     cv::imshow("medium", medium_cut);
  //     cv::imshow("far", close_cut);
  //     cv::imshow("close", far_cut);
  //   std::cout << "min = " << min << " max = " << max << "\n";
  //   my_img.convertTo(my_img, CV_8U);
  //   far_cut.convertTo(far_cut, CV_8U, .1);
  //   medium_cut.convertTo(medium_cut, CV_8U, .1);


  //   cv::Mat edge;
  //   cv::Mat edge_close;
  //   cv::Mat edge_medium;
  //   cv::Mat features_close;
  //   cv::Mat features_medium;



  //   cv::Canny(my_img, edge, lowThreshold, lowThreshold*3);
  //   cv::Canny(far_cut, edge_close, lowThreshold, lowThreshold*3);
  //   cv::Canny(medium_cut, edge_medium, lowThreshold, lowThreshold*3);



  // //   cv::Scalar mean, std;
  // //   cv::meanStdDev(my_img, mean, std);
  // //   std::cout<<"mean = "<<mean<<"\n";
  // //   std::cout<<"width = " << my_img.cols << "  height = " << my_img.type() <<"\n";

  // int minHessian = 1000;

  // cv::Ptr<SURF> detector = SURF::create( minHessian );

  // std::vector<cv::KeyPoint> keypoints2;
  // detector->detect( edge_close, keypoints2);
  // drawKeypoints( my_img, keypoints2, features_close, cv::Scalar::all(-1), cv::DrawMatchesFlags::DEFAULT );

  // std::vector<cv::KeyPoint> keypoints3;
  // detector->detect( edge, keypoints3);
  // drawKeypoints( my_img, keypoints3, features_medium, cv::Scalar::all(-1), cv::DrawMatchesFlags::DEFAULT );


  //     cv::imshow("edge_canny", edge);
  //     cv::imshow("edge_canny_close", edge_close);
  //     cv::imshow("edge_canny_medium", edge_medium);
  //     cv::imshow("features_close", features_close);
  //     cv::imshow("features_medium", features_medium);



  //   cv::waitKey(30);
  // }
  // catch (cv_bridge::Exception& e)
  // {
  //   //ROS_ERROR("Could not convert from '%s' to 'mono16'.", msg->encoding.c_str());
  //   ROS_ERROR("cv_bridge exception: %s", e.what());
  // }
}



int main(int argc, char **argv)
{


  // cv::namedWindow("medium");
  // cv::namedWindow("close");
  // cv::namedWindow("far");
  // cv::namedWindow("edge_canny");
  // cv::namedWindow("features_close");
  // cv::namedWindow("features_medium");
  // cv::namedWindow("edge_canny_close");
  // cv::namedWindow("edge_canny_medium");
  
  
ros::init(argc, argv, "image_listener");

ros::NodeHandle nh;
image_transport::ImageTransport it(nh);

  

  cv::startWindowThread();
  pub = it.advertise("sick/image", 1);
  image_transport::Subscriber sub = it.subscribe("/sick_visionary_t_driver/intensity", 1, imageCallback);

  ros::spin();
  cv::destroyWindow("view");
}