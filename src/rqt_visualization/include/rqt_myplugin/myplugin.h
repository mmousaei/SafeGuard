#ifndef DUSTCART_GUI_H
#define DUSTCART_GUI_H

#include <ros/ros.h>
#include <std_msgs/Int8.h>
#include <ui_myplugin.h>
#include <rqt_gui_cpp/plugin.h>
#include <QWidget>

namespace rqt_myplugin {

class MyPlugin : public rqt_gui_cpp::Plugin {
  Q_OBJECT
public:

  void initPlugin(qt_gui_cpp::PluginContext& context);

  MyPlugin();
  ~MyPlugin();

  ros::NodeHandle nh_;
  ros::Subscriber value_sub_;

private:

  void callback(const std_msgs::Int8ConstPtr& ptr);

  QWidget* widget_;
  Ui::MyPluginWidget ui_;

signals:
  void newValue(int value);
};

}

#endif // DUSTCART_GUI_H

