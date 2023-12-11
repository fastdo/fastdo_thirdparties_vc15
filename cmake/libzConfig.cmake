get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../" ABSOLUTE)

add_library(libz SHARED IMPORTED)
add_library(libz_a STATIC IMPORTED)
add_library(zlib_a STATIC IMPORTED)
set_target_properties(
    libz libz_a zlib_a
    PROPERTIES
        INTERFACE_INCLUDE_DIRECTORIES "${PACKAGE_PREFIX_DIR}/include"
)
set_target_properties(libz PROPERTIES INTERFACE_COMPILE_DEFINITIONS "HAVE_Z;ZLIB_WINAPI;ZLIB_DLL")
set_target_properties(libz_a PROPERTIES INTERFACE_COMPILE_DEFINITIONS "HAVE_Z;ZLIB_WINAPI")
set_target_properties(zlib_a PROPERTIES INTERFACE_COMPILE_DEFINITIONS "HAVE_Z")

if(CMAKE_SIZEOF_VOID_P EQUAL 8)
    set_target_properties(
        libz
        PROPERTIES
            IMPORTED_IMPLIB "${PACKAGE_PREFIX_DIR}/x64-Release/dll/zlibwapi.lib"
            IMPORTED_LOCATION "${PACKAGE_PREFIX_DIR}/x64-Release/dll/zlibwapi.dll"
    )
    set_target_properties(
        libz_a
        PROPERTIES
            IMPORTED_LOCATION "${PACKAGE_PREFIX_DIR}/x64-Release/lib/zlibstat.lib"
    )
    set_target_properties(
        zlib_a
        PROPERTIES
            IMPORTED_LOCATION "${PACKAGE_PREFIX_DIR}/x64-Release/lib/zlib.lib"
    )
elseif(CMAKE_SIZEOF_VOID_P EQUAL 4)
    set_target_properties(
        libz
        PROPERTIES
            IMPORTED_IMPLIB "${PACKAGE_PREFIX_DIR}/x86-Release/dll/zlibwapi.lib"
            IMPORTED_LOCATION "${PACKAGE_PREFIX_DIR}/x86-Release/dll/zlibwapi.dll"
    )
    set_target_properties(
        libz_a
        PROPERTIES
            IMPORTED_LOCATION "${PACKAGE_PREFIX_DIR}/x86-Release/lib/zlibstat.lib"
    )
    set_target_properties(
        zlib_a
        PROPERTIES
            IMPORTED_LOCATION "${PACKAGE_PREFIX_DIR}/x86-Release/lib/zlib.lib"
    )
endif()
