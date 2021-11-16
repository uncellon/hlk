cmake_minimum_required(VERSION 3.16)
project(hlk)

option(BUILD_EVENTS "Build Event header-only library" ON)
option(BUILD_LOGGER "Build Log library" ON)
option(BUILD_GPIO "Build GPIO library (based on ABIv2)" ON)
option(BUILD_SERIALPORT "Build Serial port library" ON)
option(BUILD_TIMERS "Build Timers library" ON)
option(BUILD_POOL "Build Pool library" ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall")

if (BUILD_EVENTS)
    add_subdirectory(events)
    list(APPEND CMAKE_PREFIX_PATH ${CMAKE_BINARY_DIR}/events)

    if(BUILD_GPIO)
        add_subdirectory(gpio)
        list(APPEND CMAKE_PREFIX_PATH ${CMAKE_BINARY_DIR}/gpio)
    endif()

    if(BUILD_SERIALPORT)
        add_subdirectory(serialport)
        list(APPEND CMAKE_PREFIX_PATH ${CMAKE_BINARY_DIR}/serialport)
    endif()

    if(BUILD_POOL)
        add_subdirectory(pool)
        list(APPEND CMAKE_PREFIX_PATH ${CMAKE_BINARY_DIR}/pool)
    endif()

    if(BUILD_TIMERS)
        add_subdirectory(timers)
        list(APPEND CMAKE_PREFIX_PATH ${CMAKE_BINARY_DIR}/timers)
    endif()
endif()

if(BUILD_LOGGER)
    add_subdirectory(logger)
    list(APPEND CMAKE_PREFIX_PATH ${CMAKE_BINARY_DIR}/logger)
    find_package(HlkLogger)
endif()