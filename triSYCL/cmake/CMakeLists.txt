cmake_minimum_required(VERSION 3.12)

project(triSYCL_Hello_World)


# find hipSYCL
list(APPEND CMAKE_MODULE_PATH "$ENV{TRISYCL_MODULE_PATH}")
find_package(triSYCL)


# SYCL 1.2.1
set(EXECUTABLE_NAME "cmake_hello_world_1.2.1.out")
add_executable(${EXECUTABLE_NAME} ../../hello_world_1.2.1.cpp)

target_compile_features(${EXECUTABLE_NAME} PUBLIC cxx_std_17)
#add_sycl_to_target(${EXECUTABLE_NAME})


# SYCL 2020
set(EXECUTABLE_NAME "cmake_hello_world_2020.out")
add_executable(${EXECUTABLE_NAME} ../../hello_world_2020.cpp)

target_compile_features(${EXECUTABLE_NAME} PUBLIC cxx_std_17)
#add_sycl_to_target(${EXECUTABLE_NAME})
