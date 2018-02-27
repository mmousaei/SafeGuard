execute_process(COMMAND "/home/mohammad/Documents/CMU/RED/catkin_ws/src/cmake-build-debug/rqt_safeguard/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/mohammad/Documents/CMU/RED/catkin_ws/src/cmake-build-debug/rqt_safeguard/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
