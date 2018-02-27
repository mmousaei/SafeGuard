# Install script for directory: /home/mohammad/Documents/CMU/RED/catkin_ws/src/rqt_safeguard

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/mohammad/Documents/CMU/RED/catkin_ws/src/cmake-build-debug/rqt_safeguard/catkin_generated/installspace/rqt_safeguard.pc")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rqt_safeguard/cmake" TYPE FILE FILES
    "/home/mohammad/Documents/CMU/RED/catkin_ws/src/cmake-build-debug/rqt_safeguard/catkin_generated/installspace/rqt_safeguardConfig.cmake"
    "/home/mohammad/Documents/CMU/RED/catkin_ws/src/cmake-build-debug/rqt_safeguard/catkin_generated/installspace/rqt_safeguardConfig-version.cmake"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rqt_safeguard" TYPE FILE FILES "/home/mohammad/Documents/CMU/RED/catkin_ws/src/rqt_safeguard/package.xml")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  include("/home/mohammad/Documents/CMU/RED/catkin_ws/src/cmake-build-debug/rqt_safeguard/catkin_generated/safe_execute_install.cmake")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rqt_safeguard" TYPE FILE FILES "/home/mohammad/Documents/CMU/RED/catkin_ws/src/rqt_safeguard/plugin.xml")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rqt_safeguard" TYPE DIRECTORY FILES "/home/mohammad/Documents/CMU/RED/catkin_ws/src/rqt_safeguard/resource")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/rqt_safeguard" TYPE PROGRAM FILES "/home/mohammad/Documents/CMU/RED/catkin_ws/src/rqt_safeguard/scripts/rqt_plot")
endif()

