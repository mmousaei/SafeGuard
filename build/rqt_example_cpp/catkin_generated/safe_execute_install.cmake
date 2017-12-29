execute_process(COMMAND "/home/mohammadreza/Documents/CMU-Project/RED/catkin_ws/build/rqt_example_cpp/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/mohammadreza/Documents/CMU-Project/RED/catkin_ws/build/rqt_example_cpp/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
