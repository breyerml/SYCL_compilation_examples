help([[
Modulefile support for the AdaptiveCpp SYCL implementation.
]])

local version = "SYCL2020"

whatis("Name: " .. myModuleName())
whatis("Version: " .. version)
whatis("Category: Lmod/Modulefiles")
whatis("Keywords: SYCL, Library, C++")
whatis("URL: https://github.com/AdaptiveCpp/AdaptiveCpp")
whatis("Description: University of Heidelberg's SYCL implementation AdaptiveCpp.")


depends_on("llvm")
depends_on("boost")


local acpp_root = "Programs/AdaptiveCpp/install/bin"

prepend_path("CPLUS_INCLUDE_PATH", pathJoin(os.getenv("HOME"), acpp_root, "include"))
prepend_path("PATH", pathJoin(os.getenv("HOME"), acpp_root, "bin"))


if mode() == "load" then
    LmodMessage(string.format("Loading %s version %s", myModuleName(), version))
end

if mode() == "unload" then
    LmodMessage(string.format("Removing %s version %s", myModuleName(), version))
end

conflict("AdaptiveCpp")
