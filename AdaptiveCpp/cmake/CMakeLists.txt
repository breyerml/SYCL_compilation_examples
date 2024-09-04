cmake_minimum_required(VERSION 3.12)

project(AdaptiveCpp_Hello_World)


# find AdaptiveCpp
find_package(AdaptiveCpp REQUIRED)


# SYCL 1.2.1
set(EXECUTABLE_NAME "cmake_hello_world_1.2.1.out")
add_executable(${EXECUTABLE_NAME} ../../hello_world_1.2.1.cpp)

target_compile_features(${EXECUTABLE_NAME} PUBLIC cxx_std_17)
add_sycl_to_target(TARGET ${EXECUTABLE_NAME} SOURCES ../../hello_world_1.2.1.cpp)


# SYCL 2020
set(EXECUTABLE_NAME "cmake_hello_world_2020.out")
add_executable(${EXECUTABLE_NAME} ../../hello_world_2020.cpp)

target_compile_features(${EXECUTABLE_NAME} PUBLIC cxx_std_17)
add_sycl_to_target(TARGET ${EXECUTABLE_NAME} SOURCES ../../hello_world_2020.cpp)
