# CMake version
cmake_minimum_required (VERSION 2.8)

# project name
project (cv)
add_subdirectory (src)

# CPack packaging tool
include (CPack)
set (CPACK_SOURCE_GENERATOR "TBZ2")
