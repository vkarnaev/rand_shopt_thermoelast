# Install script for directory: /Users/karnae0000/Documents/researches/SO/topoptlib/mmg

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
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
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

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/Library/Developer/CommandLineTools/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/mmg/common" TYPE FILE FILES
    "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/src/common/mmg_export.h"
    "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/src/common/libmmgtypes.h"
    "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/src/common/mmgcmakedefines.h"
    "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/src/common/mmgcmakedefinesf.h"
    "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/src/common/mmgversion.h"
    "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/src/common/libmmgtypesf.h"
    "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/src/common/git_log_mmg.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/man/man1" TYPE FILE FILES "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/doc/man/mmg2d.1.gz")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/mmg/mmg2d" TYPE FILE FILES
    "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/src/mmg2d/mmg2d_export.h"
    "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/src/mmg2d/libmmg2d.h"
    "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/src/mmg2d/libmmg2df.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/lib/libmmg2d.a")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmmg2d.a" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmmg2d.a")
    execute_process(COMMAND "/Library/Developer/CommandLineTools/usr/bin/ranlib" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmmg2d.a")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "appli" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/bin/mmg2d_O3")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/mmg2d_O3" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/mmg2d_O3")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Library/Developer/CommandLineTools/usr/bin/strip" -u -r "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/mmg2d_O3")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/lib/libmmgs.a")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmmgs.a" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmmgs.a")
    execute_process(COMMAND "/Library/Developer/CommandLineTools/usr/bin/ranlib" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmmgs.a")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/man/man1" TYPE FILE FILES "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/doc/man/mmgs.1.gz")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/mmg/mmgs" TYPE FILE FILES
    "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/src/mmgs/mmgs_export.h"
    "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/src/mmgs/libmmgs.h"
    "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/src/mmgs/libmmgsf.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "appli" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/bin/mmgs_O3")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/mmgs_O3" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/mmgs_O3")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Library/Developer/CommandLineTools/usr/bin/strip" -u -r "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/mmgs_O3")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/lib/libmmg3d.a")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmmg3d.a" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmmg3d.a")
    execute_process(COMMAND "/Library/Developer/CommandLineTools/usr/bin/ranlib" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmmg3d.a")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/man/man1" TYPE FILE FILES "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/doc/man/mmg3d.1.gz")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "headers" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/mmg/mmg3d" TYPE FILE FILES
    "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/src/mmg3d/mmg3d_export.h"
    "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/src/mmg3d/libmmg3d.h"
    "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/src/mmg3d/libmmg3df.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "appli" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/bin/mmg3d_O3")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/mmg3d_O3" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/mmg3d_O3")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Library/Developer/CommandLineTools/usr/bin/strip" -u -r "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/mmg3d_O3")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/lib/libmmg.a")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmmg.a" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmmg.a")
    execute_process(COMMAND "/Library/Developer/CommandLineTools/usr/bin/ranlib" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmmg.a")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/man/man1" TYPE FILE FILES "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/doc/man/mmg2d.1.gz")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/man/man1" TYPE FILE FILES "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/doc/man/mmg3d.1.gz")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/man/man1" TYPE FILE FILES "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/doc/man/mmgs.1.gz")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/mmg/mmg2d" TYPE FILE FILES
    "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/src/mmg2d/mmg2d_export.h"
    "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/src/mmg2d/libmmg2d.h"
    "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/src/mmg2d/libmmg2df.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/mmg/mmgs" TYPE FILE FILES
    "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/src/mmgs/mmgs_export.h"
    "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/src/mmgs/libmmgs.h"
    "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/src/mmgs/libmmgsf.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/mmg/mmg3d" TYPE FILE FILES
    "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/src/mmg3d/mmg3d_export.h"
    "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/src/mmg3d/libmmg3d.h"
    "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/src/mmg3d/libmmg3df.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/mmg" TYPE FILE FILES
    "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/src/mmg/libmmg.h"
    "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/src/mmg/libmmgf.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/mmg/MmgTargets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/mmg/MmgTargets.cmake"
         "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/CMakeFiles/Export/f74b78c45ccd84d8b5f0b176c3fd6a45/MmgTargets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/mmg/MmgTargets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/mmg/MmgTargets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/mmg" TYPE FILE FILES "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/CMakeFiles/Export/f74b78c45ccd84d8b5f0b176c3fd6a45/MmgTargets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/mmg" TYPE FILE FILES "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/CMakeFiles/Export/f74b78c45ccd84d8b5f0b176c3fd6a45/MmgTargets-release.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/mmg" TYPE FILE FILES "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/mmgConfig.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/mmg" TYPE FILE FILES
    "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/cmake/modules/FindSCOTCH.cmake"
    "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/cmake/modules/FindElas.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
