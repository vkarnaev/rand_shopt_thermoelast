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

# Utility rule file for copymmgcommon_libmmgtypesf.

# Include any custom commands dependencies for this target.
include CMakeFiles/copymmgcommon_libmmgtypesf.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/copymmgcommon_libmmgtypesf.dir/progress.make

CMakeFiles/copymmgcommon_libmmgtypesf: include/mmg/common/libmmgtypesf.h

include/mmg/common/libmmgtypesf.h: src/common/libmmgtypesf.h
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Copying /Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/src/common/libmmgtypesf.h in /Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/include/mmg/common/libmmgtypesf.h"
	/opt/homebrew/Cellar/cmake/3.24.2/bin/cmake -E copy /Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/src/common/libmmgtypesf.h /Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/include/mmg/common/libmmgtypesf.h

src/common/libmmgtypesf.h: bin/genheader
src/common/libmmgtypesf.h: /Users/karnae0000/Documents/researches/SO/topoptlib/mmg/src/common/libmmgtypes.h
src/common/libmmgtypesf.h: /Users/karnae0000/Documents/researches/SO/topoptlib/mmg/scripts/genfort.pl
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating Fortran header for mmg"
	/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/bin/genheader /Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/src/common/libmmgtypesf.h /Users/karnae0000/Documents/researches/SO/topoptlib/mmg/src/common/libmmgtypes.h /Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/src/common /Users/karnae0000/Documents/researches/SO/topoptlib/mmg/scripts/genfort.pl

copymmgcommon_libmmgtypesf: CMakeFiles/copymmgcommon_libmmgtypesf
copymmgcommon_libmmgtypesf: include/mmg/common/libmmgtypesf.h
copymmgcommon_libmmgtypesf: src/common/libmmgtypesf.h
copymmgcommon_libmmgtypesf: CMakeFiles/copymmgcommon_libmmgtypesf.dir/build.make
.PHONY : copymmgcommon_libmmgtypesf

# Rule to build all files generated by this target.
CMakeFiles/copymmgcommon_libmmgtypesf.dir/build: copymmgcommon_libmmgtypesf
.PHONY : CMakeFiles/copymmgcommon_libmmgtypesf.dir/build

CMakeFiles/copymmgcommon_libmmgtypesf.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/copymmgcommon_libmmgtypesf.dir/cmake_clean.cmake
.PHONY : CMakeFiles/copymmgcommon_libmmgtypesf.dir/clean

CMakeFiles/copymmgcommon_libmmgtypesf.dir/depend:
	cd /Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/karnae0000/Documents/researches/SO/topoptlib/mmg /Users/karnae0000/Documents/researches/SO/topoptlib/mmg /Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build /Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build /Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/CMakeFiles/copymmgcommon_libmmgtypesf.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/copymmgcommon_libmmgtypesf.dir/depend

