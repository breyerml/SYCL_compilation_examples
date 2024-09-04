# SYCL Compilation Examples

Compilation examples using CMake and normal make for the two major SYCL implementations: AdaptiveCpp from the University of Heidelberg and Intel's icpx.

Example (lua) modulefiles for lmod can be found in the `.modulefiles` directory. Note that the root paths for the respective SYCL implementations must be changed according to your installation.


### AdaptiveCpp

AdaptiveCpp can be downloaded at https://github.com/AdaptiveCpp/AdaptiveCpp.


### icpx

Can be installed using one of the provided methods at https://software.intel.com/content/www/us/en/develop/tools/oneapi/base-toolkit/download.html.

Modulefiles can be automatically generated with `./path/to/oneAPI/modulefiles-setup.sh --output-dir=OUTPUT_DIR`
