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

# Utility rule file for copymmgcommon_mmggithash.

# Include any custom commands dependencies for this target.
include CMakeFiles/copymmgcommon_mmggithash.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/copymmgcommon_mmggithash.dir/progress.make

CMakeFiles/copymmgcommon_mmggithash: include/mmg/common/git_log_mmg.h

include/mmg/common/git_log_mmg.h: src/common/git_log_mmg.h
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Copying /Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/src/common/git_log_mmg.h in /Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/include/mmg/common/git_log_mmg.h"
	/opt/homebrew/Cellar/cmake/3.24.2/bin/cmake -E copy /Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/src/common/git_log_mmg.h /Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/include/mmg/common/git_log_mmg.h

copymmgcommon_mmggithash: CMakeFiles/copymmgcommon_mmggithash
copymmgcommon_mmggithash: include/mmg/common/git_log_mmg.h
copymmgcommon_mmggithash: CMakeFiles/copymmgcommon_mmggithash.dir/build.make
.PHONY : copymmgcommon_mmggithash

# Rule to build all files generated by this target.
CMakeFiles/copymmgcommon_mmggithash.dir/build: copymmgcommon_mmggithash
.PHONY : CMakeFiles/copymmgcommon_mmggithash.dir/build

CMakeFiles/copymmgcommon_mmggithash.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/copymmgcommon_mmggithash.dir/cmake_clean.cmake
.PHONY : CMakeFiles/copymmgcommon_mmggithash.dir/clean

CMakeFiles/copymmgcommon_mmggithash.dir/depend:
	cd /Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/karnae0000/Documents/researches/SO/topoptlib/mmg /Users/karnae0000/Documents/researches/SO/topoptlib/mmg /Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build /Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build /Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/CMakeFiles/copymmgcommon_mmggithash.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/copymmgcommon_mmggithash.dir/depend

