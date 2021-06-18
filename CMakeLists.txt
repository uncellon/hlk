cmake_minimum_required(VERSION 3.16)
project(hlk)

option(BUILD_EVENTS "Build Event header-only library" ON)
option(BUILD_LOG "Build Log library" ON)
option(BUILD_QTLOG "Build QtLog header-only library based on Log library" ON)
option(BUILD_GPIO "Build GPIO library (based on ABIv2)" OFF)
option(BUILD_SERIALPORT "Build Serial port library" ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall")

if (BUILD_EVENTS)
    add_subdirectory(events)
    # The configuration file of the interface libraries for some reason is not found automatically 
    list(APPEND CMAKE_PREFIX_PATH ${CMAKE_BINARY_DIR}/events)
    if(BUILD_GPIO)
        add_subdirectory(gpio)
    endif()
    if(BUILD_SERIALPORT)
        add_subdirectory(serialport)
    endif()
endif()

if(BUILD_LOG)
    add_subdirectory(log)
    find_package(HlkLog)
    if(BUILD_QTLOG)
        add_subdirectory(qtlog)
        # The configuration file of the interface libraries for some reason is not found automatically 
        list(APPEND CMAKE_PREFIX_PATH ${CMAKE_BINARY_DIR}/qtlog)
    endif()
endif()