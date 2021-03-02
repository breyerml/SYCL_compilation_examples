cmake_minimum_required(VERSION 3.12)

# set oneAPI copmiler
set(CMAKE_CXX_COMPILER "dpcpp") 

project(oneAPI_Hello_World)



# SYCL 1.2.1
set(EXECUTABLE_NAME "cmake_hello_world_1.2.1.out")
add_executable(${EXECUTABLE_NAME} ../../hello_world_1.2.1.cpp)

target_compile_features(${EXECUTABLE_NAME} PUBLIC cxx_std_14)
target_compile_options(${EXECUTABLE_NAME} PUBLIC -sycl-std=2017)


# SYCL 2020
set(EXECUTABLE_NAME "cmake_hello_world_2020.out")
add_executable(${EXECUTABLE_NAME} ../../hello_world_2020.cpp)

target_compile_features(${EXECUTABLE_NAME} PUBLIC cxx_std_17)
target_compile_options(${EXECUTABLE_NAME} PUBLIC -sycl-std=2020)
