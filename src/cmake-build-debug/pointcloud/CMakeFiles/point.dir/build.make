# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.9

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = "/home/mohammad/Desktop/JetBrains CLion 2017.3.1 Build 173.4127.32 Linux/clion-2017.3.1/bin/cmake/bin/cmake"

# The command to remove a file.
RM = "/home/mohammad/Desktop/JetBrains CLion 2017.3.1 Build 173.4127.32 Linux/clion-2017.3.1/bin/cmake/bin/cmake" -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/mohammad/Documents/CMU/RED/catkin_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/mohammad/Documents/CMU/RED/catkin_ws/src/cmake-build-debug

# Include any dependencies generated for this target.
include pointcloud/CMakeFiles/point.dir/depend.make

# Include the progress variables for this target.
include pointcloud/CMakeFiles/point.dir/progress.make

# Include the compile flags for this target's objects.
include pointcloud/CMakeFiles/point.dir/flags.make

pointcloud/CMakeFiles/point.dir/cylider_seg.cpp.o: pointcloud/CMakeFiles/point.dir/flags.make
pointcloud/CMakeFiles/point.dir/cylider_seg.cpp.o: ../pointcloud/cylider_seg.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mohammad/Documents/CMU/RED/catkin_ws/src/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object pointcloud/CMakeFiles/point.dir/cylider_seg.cpp.o"
	cd /home/mohammad/Documents/CMU/RED/catkin_ws/src/cmake-build-debug/pointcloud && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/point.dir/cylider_seg.cpp.o -c /home/mohammad/Documents/CMU/RED/catkin_ws/src/pointcloud/cylider_seg.cpp

pointcloud/CMakeFiles/point.dir/cylider_seg.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/point.dir/cylider_seg.cpp.i"
	cd /home/mohammad/Documents/CMU/RED/catkin_ws/src/cmake-build-debug/pointcloud && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mohammad/Documents/CMU/RED/catkin_ws/src/pointcloud/cylider_seg.cpp > CMakeFiles/point.dir/cylider_seg.cpp.i

pointcloud/CMakeFiles/point.dir/cylider_seg.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/point.dir/cylider_seg.cpp.s"
	cd /home/mohammad/Documents/CMU/RED/catkin_ws/src/cmake-build-debug/pointcloud && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mohammad/Documents/CMU/RED/catkin_ws/src/pointcloud/cylider_seg.cpp -o CMakeFiles/point.dir/cylider_seg.cpp.s

pointcloud/CMakeFiles/point.dir/cylider_seg.cpp.o.requires:

.PHONY : pointcloud/CMakeFiles/point.dir/cylider_seg.cpp.o.requires

pointcloud/CMakeFiles/point.dir/cylider_seg.cpp.o.provides: pointcloud/CMakeFiles/point.dir/cylider_seg.cpp.o.requires
	$(MAKE) -f pointcloud/CMakeFiles/point.dir/build.make pointcloud/CMakeFiles/point.dir/cylider_seg.cpp.o.provides.build
.PHONY : pointcloud/CMakeFiles/point.dir/cylider_seg.cpp.o.provides

pointcloud/CMakeFiles/point.dir/cylider_seg.cpp.o.provides.build: pointcloud/CMakeFiles/point.dir/cylider_seg.cpp.o


pointcloud/CMakeFiles/point.dir/pointcloud_process.cpp.o: pointcloud/CMakeFiles/point.dir/flags.make
pointcloud/CMakeFiles/point.dir/pointcloud_process.cpp.o: ../pointcloud/pointcloud_process.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mohammad/Documents/CMU/RED/catkin_ws/src/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object pointcloud/CMakeFiles/point.dir/pointcloud_process.cpp.o"
	cd /home/mohammad/Documents/CMU/RED/catkin_ws/src/cmake-build-debug/pointcloud && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/point.dir/pointcloud_process.cpp.o -c /home/mohammad/Documents/CMU/RED/catkin_ws/src/pointcloud/pointcloud_process.cpp

pointcloud/CMakeFiles/point.dir/pointcloud_process.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/point.dir/pointcloud_process.cpp.i"
	cd /home/mohammad/Documents/CMU/RED/catkin_ws/src/cmake-build-debug/pointcloud && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mohammad/Documents/CMU/RED/catkin_ws/src/pointcloud/pointcloud_process.cpp > CMakeFiles/point.dir/pointcloud_process.cpp.i

pointcloud/CMakeFiles/point.dir/pointcloud_process.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/point.dir/pointcloud_process.cpp.s"
	cd /home/mohammad/Documents/CMU/RED/catkin_ws/src/cmake-build-debug/pointcloud && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mohammad/Documents/CMU/RED/catkin_ws/src/pointcloud/pointcloud_process.cpp -o CMakeFiles/point.dir/pointcloud_process.cpp.s

pointcloud/CMakeFiles/point.dir/pointcloud_process.cpp.o.requires:

.PHONY : pointcloud/CMakeFiles/point.dir/pointcloud_process.cpp.o.requires

pointcloud/CMakeFiles/point.dir/pointcloud_process.cpp.o.provides: pointcloud/CMakeFiles/point.dir/pointcloud_process.cpp.o.requires
	$(MAKE) -f pointcloud/CMakeFiles/point.dir/build.make pointcloud/CMakeFiles/point.dir/pointcloud_process.cpp.o.provides.build
.PHONY : pointcloud/CMakeFiles/point.dir/pointcloud_process.cpp.o.provides

pointcloud/CMakeFiles/point.dir/pointcloud_process.cpp.o.provides.build: pointcloud/CMakeFiles/point.dir/pointcloud_process.cpp.o


# Object files for target point
point_OBJECTS = \
"CMakeFiles/point.dir/cylider_seg.cpp.o" \
"CMakeFiles/point.dir/pointcloud_process.cpp.o"

# External object files for target point
point_EXTERNAL_OBJECTS =

devel/lib/pcl_processor/point: pointcloud/CMakeFiles/point.dir/cylider_seg.cpp.o
devel/lib/pcl_processor/point: pointcloud/CMakeFiles/point.dir/pointcloud_process.cpp.o
devel/lib/pcl_processor/point: pointcloud/CMakeFiles/point.dir/build.make
devel/lib/pcl_processor/point: pointcloud/CMakeFiles/point.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/mohammad/Documents/CMU/RED/catkin_ws/src/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable ../devel/lib/pcl_processor/point"
	cd /home/mohammad/Documents/CMU/RED/catkin_ws/src/cmake-build-debug/pointcloud && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/point.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
pointcloud/CMakeFiles/point.dir/build: devel/lib/pcl_processor/point

.PHONY : pointcloud/CMakeFiles/point.dir/build

pointcloud/CMakeFiles/point.dir/requires: pointcloud/CMakeFiles/point.dir/cylider_seg.cpp.o.requires
pointcloud/CMakeFiles/point.dir/requires: pointcloud/CMakeFiles/point.dir/pointcloud_process.cpp.o.requires

.PHONY : pointcloud/CMakeFiles/point.dir/requires

pointcloud/CMakeFiles/point.dir/clean:
	cd /home/mohammad/Documents/CMU/RED/catkin_ws/src/cmake-build-debug/pointcloud && $(CMAKE_COMMAND) -P CMakeFiles/point.dir/cmake_clean.cmake
.PHONY : pointcloud/CMakeFiles/point.dir/clean

pointcloud/CMakeFiles/point.dir/depend:
	cd /home/mohammad/Documents/CMU/RED/catkin_ws/src/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mohammad/Documents/CMU/RED/catkin_ws/src /home/mohammad/Documents/CMU/RED/catkin_ws/src/pointcloud /home/mohammad/Documents/CMU/RED/catkin_ws/src/cmake-build-debug /home/mohammad/Documents/CMU/RED/catkin_ws/src/cmake-build-debug/pointcloud /home/mohammad/Documents/CMU/RED/catkin_ws/src/cmake-build-debug/pointcloud/CMakeFiles/point.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : pointcloud/CMakeFiles/point.dir/depend

