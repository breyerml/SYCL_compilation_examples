help([[
Modulefile support for the triSYCL SYCL implementation.
]])

local version = "master"

whatis("Name: " .. myModuleName())
whatis("Version: " .. version)
whatis("Category: Lmod/Modulefiles")
whatis("Keywords: SYCL, Library, C++")
whatis("URL: https://github.com/triSYCL/triSYCL")
whatis("Description: Xilinx's SYCL implementation triSYCL.")


depends_on("llvm")
depends_on("boost")
depends_on("range-v3")


local trisycl_root = "Programs/triSYCL/install"

prepend_path("CPLUS_INCLUDE_PATH", pathJoin(os.getenv("HOME"), trisycl_root, "install/include"))
setenv("TRISYCL_MODULE_PATH", pathJoin(os.getenv("HOME"), trisycl_root, "share/cmake/triSYCL"))


if mode() == "load" then
    LmodMessage(string.format("Loading %s version %s", myModuleName(), version))
    LmodMessage("  For CMake support add \"list(APPEND CMAKE_MODULE_PATH $ENV{TRISYCL_MODULE_PATH})\" to your CMakeLists.txt file.")
end

if mode() == "unload" then
    LmodMessage(string.format("Removing %s version %s", myModuleName(), version))
end

conflict("triSYCL")
