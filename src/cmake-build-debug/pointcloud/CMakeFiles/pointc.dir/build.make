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
include pointcloud/CMakeFiles/pointc.dir/depend.make

# Include the progress variables for this target.
include pointcloud/CMakeFiles/pointc.dir/progress.make

# Include the compile flags for this target's objects.
include pointcloud/CMakeFiles/pointc.dir/flags.make

pointcloud/CMakeFiles/pointc.dir/cylider_seg.cpp.o: pointcloud/CMakeFiles/pointc.dir/flags.make
pointcloud/CMakeFiles/pointc.dir/cylider_seg.cpp.o: ../pointcloud/cylider_seg.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mohammad/Documents/CMU/RED/catkin_ws/src/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object pointcloud/CMakeFiles/pointc.dir/cylider_seg.cpp.o"
	cd /home/mohammad/Documents/CMU/RED/catkin_ws/src/cmake-build-debug/pointcloud && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/pointc.dir/cylider_seg.cpp.o -c /home/mohammad/Documents/CMU/RED/catkin_ws/src/pointcloud/cylider_seg.cpp

pointcloud/CMakeFiles/pointc.dir/cylider_seg.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pointc.dir/cylider_seg.cpp.i"
	cd /home/mohammad/Documents/CMU/RED/catkin_ws/src/cmake-build-debug/pointcloud && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mohammad/Documents/CMU/RED/catkin_ws/src/pointcloud/cylider_seg.cpp > CMakeFiles/pointc.dir/cylider_seg.cpp.i

pointcloud/CMakeFiles/pointc.dir/cylider_seg.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pointc.dir/cylider_seg.cpp.s"
	cd /home/mohammad/Documents/CMU/RED/catkin_ws/src/cmake-build-debug/pointcloud && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mohammad/Documents/CMU/RED/catkin_ws/src/pointcloud/cylider_seg.cpp -o CMakeFiles/pointc.dir/cylider_seg.cpp.s

pointcloud/CMakeFiles/pointc.dir/cylider_seg.cpp.o.requires:

.PHONY : pointcloud/CMakeFiles/pointc.dir/cylider_seg.cpp.o.requires

pointcloud/CMakeFiles/pointc.dir/cylider_seg.cpp.o.provides: pointcloud/CMakeFiles/pointc.dir/cylider_seg.cpp.o.requires
	$(MAKE) -f pointcloud/CMakeFiles/pointc.dir/build.make pointcloud/CMakeFiles/pointc.dir/cylider_seg.cpp.o.provides.build
.PHONY : pointcloud/CMakeFiles/pointc.dir/cylider_seg.cpp.o.provides

pointcloud/CMakeFiles/pointc.dir/cylider_seg.cpp.o.provides.build: pointcloud/CMakeFiles/pointc.dir/cylider_seg.cpp.o


pointcloud/CMakeFiles/pointc.dir/pointcloud_process.cpp.o: pointcloud/CMakeFiles/pointc.dir/flags.make
pointcloud/CMakeFiles/pointc.dir/pointcloud_process.cpp.o: ../pointcloud/pointcloud_process.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mohammad/Documents/CMU/RED/catkin_ws/src/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object pointcloud/CMakeFiles/pointc.dir/pointcloud_process.cpp.o"
	cd /home/mohammad/Documents/CMU/RED/catkin_ws/src/cmake-build-debug/pointcloud && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/pointc.dir/pointcloud_process.cpp.o -c /home/mohammad/Documents/CMU/RED/catkin_ws/src/pointcloud/pointcloud_process.cpp

pointcloud/CMakeFiles/pointc.dir/pointcloud_process.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pointc.dir/pointcloud_process.cpp.i"
	cd /home/mohammad/Documents/CMU/RED/catkin_ws/src/cmake-build-debug/pointcloud && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mohammad/Documents/CMU/RED/catkin_ws/src/pointcloud/pointcloud_process.cpp > CMakeFiles/pointc.dir/pointcloud_process.cpp.i

pointcloud/CMakeFiles/pointc.dir/pointcloud_process.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pointc.dir/pointcloud_process.cpp.s"
	cd /home/mohammad/Documents/CMU/RED/catkin_ws/src/cmake-build-debug/pointcloud && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mohammad/Documents/CMU/RED/catkin_ws/src/pointcloud/pointcloud_process.cpp -o CMakeFiles/pointc.dir/pointcloud_process.cpp.s

pointcloud/CMakeFiles/pointc.dir/pointcloud_process.cpp.o.requires:

.PHONY : pointcloud/CMakeFiles/pointc.dir/pointcloud_process.cpp.o.requires

pointcloud/CMakeFiles/pointc.dir/pointcloud_process.cpp.o.provides: pointcloud/CMakeFiles/pointc.dir/pointcloud_process.cpp.o.requires
	$(MAKE) -f pointcloud/CMakeFiles/pointc.dir/build.make pointcloud/CMakeFiles/pointc.dir/pointcloud_process.cpp.o.provides.build
.PHONY : pointcloud/CMakeFiles/pointc.dir/pointcloud_process.cpp.o.provides

pointcloud/CMakeFiles/pointc.dir/pointcloud_process.cpp.o.provides.build: pointcloud/CMakeFiles/pointc.dir/pointcloud_process.cpp.o


# Object files for target pointc
pointc_OBJECTS = \
"CMakeFiles/pointc.dir/cylider_seg.cpp.o" \
"CMakeFiles/pointc.dir/pointcloud_process.cpp.o"

# External object files for target pointc
pointc_EXTERNAL_OBJECTS =

devel/lib/pcl_processor/pointc: pointcloud/CMakeFiles/pointc.dir/cylider_seg.cpp.o
devel/lib/pcl_processor/pointc: pointcloud/CMakeFiles/pointc.dir/pointcloud_process.cpp.o
devel/lib/pcl_processor/pointc: pointcloud/CMakeFiles/pointc.dir/build.make
devel/lib/pcl_processor/pointc: pointcloud/CMakeFiles/pointc.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/mohammad/Documents/CMU/RED/catkin_ws/src/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable ../devel/lib/pcl_processor/pointc"
	cd /home/mohammad/Documents/CMU/RED/catkin_ws/src/cmake-build-debug/pointcloud && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/pointc.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
pointcloud/CMakeFiles/pointc.dir/build: devel/lib/pcl_processor/pointc

.PHONY : pointcloud/CMakeFiles/pointc.dir/build

pointcloud/CMakeFiles/pointc.dir/requires: pointcloud/CMakeFiles/pointc.dir/cylider_seg.cpp.o.requires
pointcloud/CMakeFiles/pointc.dir/requires: pointcloud/CMakeFiles/pointc.dir/pointcloud_process.cpp.o.requires

.PHONY : pointcloud/CMakeFiles/pointc.dir/requires

pointcloud/CMakeFiles/pointc.dir/clean:
	cd /home/mohammad/Documents/CMU/RED/catkin_ws/src/cmake-build-debug/pointcloud && $(CMAKE_COMMAND) -P CMakeFiles/pointc.dir/cmake_clean.cmake
.PHONY : pointcloud/CMakeFiles/pointc.dir/clean

pointcloud/CMakeFiles/pointc.dir/depend:
	cd /home/mohammad/Documents/CMU/RED/catkin_ws/src/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mohammad/Documents/CMU/RED/catkin_ws/src /home/mohammad/Documents/CMU/RED/catkin_ws/src/pointcloud /home/mohammad/Documents/CMU/RED/catkin_ws/src/cmake-build-debug /home/mohammad/Documents/CMU/RED/catkin_ws/src/cmake-build-debug/pointcloud /home/mohammad/Documents/CMU/RED/catkin_ws/src/cmake-build-debug/pointcloud/CMakeFiles/pointc.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : pointcloud/CMakeFiles/pointc.dir/depend
