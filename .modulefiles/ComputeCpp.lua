help([[
Modulefile support for ComputeCpp SYCL implementation.
]])

local version = "2.3.0"

whatis("Name: " .. myModuleName())
whatis("Version: " .. version)
whatis("Category: Lmod/Modulefiles")
whatis("Keywords: SYCL, Library, C++")
whatis("URL: https://developer.codeplay.com/products/computecpp/ce/home/")
whatis("Description: Codeplay's SYCL implementation ComputeCpp.")


local opencl_root = "Programs/intel/oneapi/compiler/latest/linux" -- highjack Intel oneAPI's OpenCl header and runtime
local computecpp_root = "Programs/ComputeCpp"

setenv("INTELOCLSDKROOT", pathJoin(os.getenv("HOME"), opencl_root))
prepend_path("CPLUS_INCLUDE_PATH", pathJoin(os.getenv("HOME"), opencl_root, "include/sycl"))
prepend_path("LD_LIBRARY_PATH", pathJoin(os.getenv("HOME"), opencl_root, "lib"))
prepend_path("LIBRARY_PATH", pathJoin(os.getenv("HOME"), opencl_root, "lib"))

prepend_path("CPLUS_INCLUDE_PATH", pathJoin(os.getenv("HOME"), computecpp_root, "include"))
prepend_path("LD_LIBRARY_PATH", pathJoin(os.getenv("HOME"), computecpp_root, "lib"))
prepend_path("LIBRARY_PATH", pathJoin(os.getenv("HOME"), computecpp_root, "lib"))

setenv("COMPUTECPP_DIR", pathJoin(os.getenv("HOME"), computecpp_root))
setenv("COMPUTECPP_MODULE_PATH", pathJoin(os.getenv("HOME"), computecpp_root, "computecpp-sdk/cmake/Modules"))
prepend_path("PATH", pathJoin(os.getenv("HOME"), computecpp_root, "bin"))


if mode() == "load" then
    LmodMessage(string.format("Loading %s version %s", myModuleName(), version))
    LmodMessage("  For CMake support add \"list(APPEND CMAKE_MODULE_PATH $ENV{COMPUTECPP_MODULE_PATH})\" to your CMakeLists.txt file.")
end

if mode() == "unload" then
    LmodMessage(string.format("Removing %s version %s", myModuleName(), version))
end

conflict("ComputeCpp")
