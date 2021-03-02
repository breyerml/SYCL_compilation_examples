cmake_minimum_required(VERSION 3.12)

project(ComputeCpp_Hello_World)


# find ComputeCpp
list(APPEND CMAKE_MODULE_PATH $ENV{COMPUTECPP_MODULE_PATH})
find_package(ComputeCpp REQUIRED)


add_definitions(-DCL_TARGET_OPENCL_VERSION=220)
list(APPEND COMPUTECPP_USER_FLAGS -no-serial-memop)


# SYCL 1.2.1
set(EXECUTABLE_NAME "cmake_hello_world_1.2.1.out")
add_executable(${EXECUTABLE_NAME} ../../hello_world_1.2.1.cpp)

target_compile_features(${EXECUTABLE_NAME} PUBLIC cxx_std_14)
set(SYCL_LANGUAGE_VERSION 2017)
add_sycl_to_target(TARGET ${EXECUTABLE_NAME} SOURCES ../../hello_world_1.2.1.cpp)


# SYCL 2020
set(EXECUTABLE_NAME "cmake_hello_world_2020.out")
add_executable(${EXECUTABLE_NAME} ../../hello_world_2020.cpp)

target_compile_features(${EXECUTABLE_NAME} PUBLIC cxx_std_17)
set(SYCL_LANGUAGE_VERSION 2020)
add_sycl_to_target(TARGET ${EXECUTABLE_NAME} SOURCES ../../hello_world_2020.cpp)
