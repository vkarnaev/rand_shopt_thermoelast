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
CMAKE_SOURCE_DIR = /Users/karnae0000/Documents/researches/SO/topoptlib/mmg

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build

# Utility rule file for copy2d_mmg2d_export.

# Include any custom commands dependencies for this target.
include CMakeFiles/copy2d_mmg2d_export.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/copy2d_mmg2d_export.dir/progress.make

CMakeFiles/copy2d_mmg2d_export: include/mmg/mmg2d/mmg2d_export.h

include/mmg/mmg2d/mmg2d_export.h: /Users/karnae0000/Documents/researches/SO/topoptlib/mmg/src/mmg2d/mmg2d_export.h
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Copying /Users/karnae0000/Documents/researches/SO/topoptlib/mmg/src/mmg2d/mmg2d_export.h in /Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/include/mmg/mmg2d/mmg2d_export.h"
	/opt/homebrew/Cellar/cmake/3.24.2/bin/cmake -E copy /Users/karnae0000/Documents/researches/SO/topoptlib/mmg/src/mmg2d/mmg2d_export.h /Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/include/mmg/mmg2d/mmg2d_export.h

copy2d_mmg2d_export: CMakeFiles/copy2d_mmg2d_export
copy2d_mmg2d_export: include/mmg/mmg2d/mmg2d_export.h
copy2d_mmg2d_export: CMakeFiles/copy2d_mmg2d_export.dir/build.make
.PHONY : copy2d_mmg2d_export

# Rule to build all files generated by this target.
CMakeFiles/copy2d_mmg2d_export.dir/build: copy2d_mmg2d_export
.PHONY : CMakeFiles/copy2d_mmg2d_export.dir/build

CMakeFiles/copy2d_mmg2d_export.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/copy2d_mmg2d_export.dir/cmake_clean.cmake
.PHONY : CMakeFiles/copy2d_mmg2d_export.dir/clean

CMakeFiles/copy2d_mmg2d_export.dir/depend:
	cd /Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/karnae0000/Documents/researches/SO/topoptlib/mmg /Users/karnae0000/Documents/researches/SO/topoptlib/mmg /Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build /Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build /Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/CMakeFiles/copy2d_mmg2d_export.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/copy2d_mmg2d_export.dir/depend
