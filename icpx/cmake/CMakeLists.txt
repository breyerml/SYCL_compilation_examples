cmake_minimum_required(VERSION 3.12)

project(icpx_Hello_World)


# SYCL 1.2.1
set(EXECUTABLE_NAME "cmake_hello_world_1.2.1.out")
add_executable(${EXECUTABLE_NAME} ../../hello_world_1.2.1.cpp)

target_compile_features(${EXECUTABLE_NAME} PUBLIC cxx_std_14)
target_compile_options(${EXECUTABLE_NAME} PUBLIC -fsycl -sycl-std=2017)
target_link_options(${EXECUTABLE_NAME} PUBLIC -fsycl)


# SYCL 2020
set(EXECUTABLE_NAME "cmake_hello_world_2020.out")
add_executable(${EXECUTABLE_NAME} ../../hello_world_2020.cpp)

target_compile_features(${EXECUTABLE_NAME} PUBLIC cxx_std_17)
target_compile_options(${EXECUTABLE_NAME} PUBLIC -fsycl -sycl-std=2020)
target_link_options(${EXECUTABLE_NAME} PUBLIC -fsycl)
