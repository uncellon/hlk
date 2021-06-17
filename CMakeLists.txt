cmake_minimum_required(VERSION 3.16)
project(hlk)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall")

if(BUILD_TEST)
    message(STATUS "BUILD_TEST found, test projects will be builded")
else()
    message(STATUS "BUILD_TEST not found or setted to false, test projects will not be builded")
endif()

add_subdirectory(events)
add_subdirectory(log)
add_subdirectory(qtlog)
add_subdirectory(serialport)
add_subdirectory(gpio)