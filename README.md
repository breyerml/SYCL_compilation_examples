# SYCL_compilation_examples
Compilation examples using CMake and normal make for the four major SYCL implementations: oneAPI, ComputeCpp, hipSYCL and triSYCL.

Example (lua) modulefiles for lmod can be found in the `.modulefiles` directory. Note that the root paths for the respective SYCL implementations must be changed according to your installation.

### ComputeCpp

ComputeCpp can be downloaded at https://developer.codeplay.com/products/computecpp/ce/download.

For the CMake integration the [ComputeCpp SDK](https://github.com/codeplaysoftware/computecpp-sdk) must be downloaded separately.

In order for ComputeCpp to work, a OpenCl installation must be provided. The provided modulefile highjacks Intel's OpenCl headers and runtime in order to achieve that.


### hipSYCL

The SYCL 2020 version of hipSYCL can be downloaded at https://github.com/illuhad/hipSYCL/tree/sycl/2020.

Dependencies are: clang (>= 10) and boost.


### triSYCL

triSYCL can be downloaded at https://github.com/triSYCL/triSYCL.

Dependencies are: clang, boost and range-v3.


### oneAPI

Can be installed using one of the provided methods at https://software.intel.com/content/www/us/en/develop/tools/oneapi/base-toolkit/download.html.

Modulefiles can be automatically generated with `./path/to/oneAPI/modulefiles-setup.sh --output-dir=OUTPUT_DIR`
