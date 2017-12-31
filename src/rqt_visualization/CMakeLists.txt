cmake_minimum_required(VERSION 2.8.3)
project(rqt_myplugin)

set(CMAKE_CXX_STANDARD 14)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rqt_gui
  rqt_gui_cpp
  std_msgs
)

## FIND QT
find_package(Qt5Widgets REQUIRED)

## DEBUG IF NOT FOUND
IF($(Qt5Widgets_NOTFOUND))
  MESSAGE(FATAL_ERROR "QT5 Wasn't found")
ELSE($(Qt5Widgets_NOTFOUND))
  MESSAGE(STATUS "Found Qt5Widgets Library at: ${Qt5Widgets_LIBRARY}")
  MESSAGE(STATUS "Found Qt5Widgets Includes at: ${Qt5Widgets_INCLUDE_DIRS}")
ENDIF($(Qt5Widgets_NOTFOUND))

catkin_package(
  INCLUDE_DIRS include
  LIBRARIES rqt_myplugin
  CATKIN_DEPENDS roscpp rqt_gui rqt_gui_cpp std_msgs
)

###########
## QT    ##
###########

qt5_wrap_cpp(MOCSrcs include/rqt_myplugin/myplugin.h)
qt5_wrap_ui(UISrcs ui/myplugin.ui)

###########
## Build ##
###########

include_directories(
  include
  ${CMAKE_CURRENT_BINARY_DIR}
  ${catkin_INCLUDE_DIRS}
  ${Qt5Widgets_INCLUDE_DIRS}
)

## Declare a C++ library
add_library(rqt_myplugin
  src/myplugin.cpp
  ${MOCSrcs}
  ${UISrcs}
)

## Specify libraries to link a library or executable target against
target_link_libraries(rqt_myplugin
  ${catkin_LIBRARIES}
  Qt5::Widgets
)


#find_package(class_loader)
#class_loader_hide_library_symbols(${PROJECT_NAME})

#############
## Install ##
#############

install(FILES plugin.xml
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
)

install(TARGETS ${PROJECT_NAME}
  ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
  LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION})

install(DIRECTORY include/${PROJECT_NAME}/
  DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}
)
