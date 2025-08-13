# Minimum CMake version
# cmake_minimum_required(VERSION <min>[..<policy_max>] [FATAL_ERROR])
# If the running version of CMake is lower than the <min> required version, it will stop processing the project and report and error.
# <policy_max> is an optional value.
cmake_minimum_required(VERSION 3.10)

# set(CMAKE_C_COMPILER "C:/Users/GTABARA/Desktop/CPP_Primer/build_tools/MinGW/bin/gcc.exe")
# set(CMAKE_CXX_COMPILER "C:/Users/GTABARA/Desktop/CPP_Primer/build_tools/MinGW/bin/g++.exe")

# To start a project, project() command is used to set the project name.
# It is a required field and should be called soon after cmake_minimum_required().
# project(<PROJECT-NAME> [<language-name>...])
# language-name is optional, by default CMake considers for C and CXX (i.e., C++)
# The value is stored in the variable PROJECT_NAME and also in CMAKE_PROJECT_NAME.
# It also sets the variables: 
#   - PROJECT_SOURCE_DIR    -> <PROJECT-NAME>_SOURCE_DIR    - absolute path to the source directory for the project.
#   - PROJECT_BINARY_DIR    -> <PROJECT-NAME>_BINARY_DIR    - absolute path to the binary directory for the project.
#   - PROJECT_IS_TOP_LEVEL  -> <PROJECT-NAME>_IS_TOP_LEVEL  - Added in version 3.21, it stores the boolean value indicating whether the project is top-level.
# Projects should not rely on <PROJECT-NAME>_SOURCE_DIR or <PROJECT-NAME>_BINARY_DIR holding a particular value outside of the scope of the call to project() or one of its child scopes.
project(CPP_Primer)

message(STATUS "Project Soource Directory: ${PROJECT_SOURCE_DIR}")

#
set(BUILD_TOOLS_PATH "${PROJECT_SOURCE_DIR}/../build_tools/")
message(STATUS "GCC Binary Path: ${BUILD_TOOLS_PATH}")

set(CMAKE_C_COMPILER "${BUILD_TOOLS_PATH}/MinGW/bin/gcc.exe")
set(CMAKE_CXX_COMPILER "${BUILD_TOOLS_PATH}/MinGW/bin/g++.exe")

# Boolean describing whether the value of CMAKE_CXX_STANDARD is a requirement.
set(CMAKE_CXX_STANDARD_REQUIRED true)

# The C++ standard whose features are requested to build this target.
set(CMAKE_CXX_STANDARD 11)

# CMAKE_BUILD_TYPE specifies the build type on single-configuration generators (e.g. Makefile Generators or Ninja).
# Typical values inlcude Debug, Release, RelWithDebInfo, but custom build types can also be defined.
if(NOT CMAKE_BUILD_TYPE)
    message("CMAKE_BUILD_TYPE is not set, defaulting to Debug.")
    set(CMAKE_BUILD_TYPE Debug)
endif()
message(STATUS "CMAKE_BUILD_TYPE: ${CMAKE_BUILD_TYPE}")

# Converts the string to all lower case.
# string(TOLOWER <string> <output_variable>)
string(TOLOWER ${CMAKE_BUILD_TYPE} CMAKE_BUILD_TYPE)
message(STATUS "CMAKE_BUILD_TYPE: ${CMAKE_BUILD_TYPE}")