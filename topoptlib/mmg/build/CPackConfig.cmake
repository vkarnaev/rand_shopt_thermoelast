# This file will be configured to contain variables for CPack. These variables
# should be set in the CMake list file of the project before CPack module is
# included. The list of available CPACK_xxx variables and their associated
# documentation may be obtained using
#  cpack --help-variable-list
#
# Some variables are common to all generators (e.g. CPACK_PACKAGE_NAME)
# and some are specific to a generator
# (e.g. CPACK_NSIS_EXTRA_INSTALL_COMMANDS). The generator specific variables
# usually begin with CPACK_<GENNAME>_xxxx.


set(CPACK_ARCHIVE_COMPONENT_INSTALL "ON")
set(CPACK_BUILD_SOURCE_DIRS "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg;/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build")
set(CPACK_CMAKE_GENERATOR "Unix Makefiles")
set(CPACK_COMPONENTS_ALL "Unspecified;appli;headers")
set(CPACK_COMPONENT_ALL "appli")
set(CPACK_COMPONENT_UNSPECIFIED_HIDDEN "TRUE")
set(CPACK_COMPONENT_UNSPECIFIED_REQUIRED "TRUE")
set(CPACK_DEFAULT_PACKAGE_DESCRIPTION_FILE "/opt/homebrew/Cellar/cmake/3.24.2/share/cmake/Templates/CPack.GenericDescription.txt")
set(CPACK_DEFAULT_PACKAGE_DESCRIPTION_SUMMARY "mmg built using CMake")
set(CPACK_DMG_SLA_USE_RESOURCE_FILE_LICENSE "ON")
set(CPACK_GENERATOR "TGZ")
set(CPACK_INCLUDE_TOPLEVEL_DIRECTORY "1")
set(CPACK_INSTALL_CMAKE_PROJECTS "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build;mmg;ALL;/")
set(CPACK_INSTALL_PREFIX "/usr/local")
set(CPACK_MODULE_PATH "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/cmake/modules;/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/cmake/testing")
set(CPACK_NSIS_DISPLAY_NAME "mmg-5.7.0")
set(CPACK_NSIS_INSTALLER_ICON_CODE "")
set(CPACK_NSIS_INSTALLER_MUI_ICON_CODE "")
set(CPACK_NSIS_INSTALL_ROOT "$PROGRAMFILES")
set(CPACK_NSIS_PACKAGE_NAME "mmg-5.7.0")
set(CPACK_NSIS_UNINSTALL_NAME "Uninstall")
set(CPACK_OSX_SYSROOT "/Library/Developer/CommandLineTools/SDKs/MacOSX13.3.sdk")
set(CPACK_OUTPUT_CONFIG_FILE "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/CPackConfig.cmake")
set(CPACK_OUTPUT_FILE_PREFIX "../archives")
set(CPACK_PACKAGE_CONTACT "contact@mmgtools.org")
set(CPACK_PACKAGE_DEFAULT_LOCATION "/")
set(CPACK_PACKAGE_DESCRIPTION_FILE "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/README.md")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "MMG: 2d, surface and 3d remeshers")
set(CPACK_PACKAGE_EXECUTABLES "mmg")
set(CPACK_PACKAGE_FILE_NAME "mmg-5.7.0-Darwin-22.5.0")
set(CPACK_PACKAGE_INSTALL_DIRECTORY "mmg-5.7.0")
set(CPACK_PACKAGE_INSTALL_REGISTRY_KEY "mmg-5.7.0")
set(CPACK_PACKAGE_NAME "mmg")
set(CPACK_PACKAGE_RELOCATABLE "true")
set(CPACK_PACKAGE_VENDOR "Cécile Dobrzynski, Pascal Frey, Charles Dapogny,; Algiane Froehly")
set(CPACK_PACKAGE_VERSION "5.7.0")
set(CPACK_PACKAGE_VERSION_MAJOR "5")
set(CPACK_PACKAGE_VERSION_MINOR "7")
set(CPACK_PACKAGE_VERSION_PATCH "0")
set(CPACK_RESOURCE_FILE_LICENSE "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/LICENSE")
set(CPACK_RESOURCE_FILE_README "/opt/homebrew/Cellar/cmake/3.24.2/share/cmake/Templates/CPack.GenericDescription.txt")
set(CPACK_RESOURCE_FILE_WELCOME "/opt/homebrew/Cellar/cmake/3.24.2/share/cmake/Templates/CPack.GenericWelcome.txt")
set(CPACK_SET_DESTDIR "OFF")
set(CPACK_SOURCE_GENERATOR "TGZ")
set(CPACK_SOURCE_OUTPUT_CONFIG_FILE "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/CPackSourceConfig.cmake")
set(CPACK_SYSTEM_NAME "Darwin")
set(CPACK_THREADS "1")
set(CPACK_TOPLEVEL_TAG "Darwin")
set(CPACK_WIX_SIZEOF_VOID_P "8")

if(NOT CPACK_PROPERTIES_FILE)
  set(CPACK_PROPERTIES_FILE "/Users/karnae0000/Documents/researches/SO/topoptlib/mmg/build/CPackProperties.cmake")
endif()

if(EXISTS ${CPACK_PROPERTIES_FILE})
  include(${CPACK_PROPERTIES_FILE})
endif()
