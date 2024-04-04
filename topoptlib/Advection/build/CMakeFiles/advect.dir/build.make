# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.24

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/homebrew/Cellar/cmake/3.24.2/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/Cellar/cmake/3.24.2/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/karnae0000/Documents/researches/SO/topoptlib/Advection

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/karnae0000/Documents/researches/SO/topoptlib/Advection/build

# Include any dependencies generated for this target.
include CMakeFiles/advect.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/advect.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/advect.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/advect.dir/flags.make

CMakeFiles/advect.dir/sources/advect.c.o: CMakeFiles/advect.dir/flags.make
CMakeFiles/advect.dir/sources/advect.c.o: /Users/karnae0000/Documents/researches/SO/topoptlib/Advection/sources/advect.c
CMakeFiles/advect.dir/sources/advect.c.o: CMakeFiles/advect.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/karnae0000/Documents/researches/SO/topoptlib/Advection/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/advect.dir/sources/advect.c.o"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/advect.dir/sources/advect.c.o -MF CMakeFiles/advect.dir/sources/advect.c.o.d -o CMakeFiles/advect.dir/sources/advect.c.o -c /Users/karnae0000/Documents/researches/SO/topoptlib/Advection/sources/advect.c

CMakeFiles/advect.dir/sources/advect.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/advect.dir/sources/advect.c.i"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/karnae0000/Documents/researches/SO/topoptlib/Advection/sources/advect.c > CMakeFiles/advect.dir/sources/advect.c.i

CMakeFiles/advect.dir/sources/advect.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/advect.dir/sources/advect.c.s"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/karnae0000/Documents/researches/SO/topoptlib/Advection/sources/advect.c -o CMakeFiles/advect.dir/sources/advect.c.s

# Object files for target advect
advect_OBJECTS = \
"CMakeFiles/advect.dir/sources/advect.c.o"

# External object files for target advect
advect_EXTERNAL_OBJECTS =

advect: CMakeFiles/advect.dir/sources/advect.c.o
advect: CMakeFiles/advect.dir/build.make
advect: libAdvection.dylib
advect: /Users/karnae0000/lib/libCommons.dylib
advect: CMakeFiles/advect.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/karnae0000/Documents/researches/SO/topoptlib/Advection/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable advect"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/advect.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/advect.dir/build: advect
.PHONY : CMakeFiles/advect.dir/build

CMakeFiles/advect.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/advect.dir/cmake_clean.cmake
.PHONY : CMakeFiles/advect.dir/clean

CMakeFiles/advect.dir/depend:
	cd /Users/karnae0000/Documents/researches/SO/topoptlib/Advection/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/karnae0000/Documents/researches/SO/topoptlib/Advection /Users/karnae0000/Documents/researches/SO/topoptlib/Advection /Users/karnae0000/Documents/researches/SO/topoptlib/Advection/build /Users/karnae0000/Documents/researches/SO/topoptlib/Advection/build /Users/karnae0000/Documents/researches/SO/topoptlib/Advection/build/CMakeFiles/advect.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/advect.dir/depend

