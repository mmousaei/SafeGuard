#include <rqt_myplugin/myplugin.h>
#include <pluginlib/class_list_macros.h>
#include <stdio.h>

namespace rqt_myplugin {

MyPlugin::MyPlugin() :
  rqt_gui_cpp::Plugin (),
  widget_(0)
{
  this->setObjectName("MyPlugin");
  std::cerr<<"hahaha"<<std::endl;
}

void MyPlugin::initPlugin(qt_gui_cpp::PluginContext& context) {

  widget_ = new QWidget();
  ui_.setupUi(widget_);
  context.addWidget(widget_);

  value_sub_ = nh_.subscribe("value", 1, &MyPlugin::callback, this);

  connect(this, &MyPlugin::newValue, ui_.statusPercent, static_cast<void (QLCDNumber::*)(int)>(&QLCDNumber::display));

}

void MyPlugin::callback(const std_msgs::Int8ConstPtr& ptr) {
  emit newValue(ptr->data);
}

MyPlugin::~MyPlugin() {

}

PLUGINLIB_DECLARE_CLASS(rqt_myplugin, MyPlugin, rqt_myplugin::MyPlugin, rqt_gui_cpp::Plugin)

}
