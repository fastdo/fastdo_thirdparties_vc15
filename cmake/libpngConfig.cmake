get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../" ABSOLUTE)

add_library(libpng SHARED IMPORTED)
add_library(libpng_a STATIC IMPORTED)
set_target_properties(
    libpng libpng_a
    PROPERTIES
        INTERFACE_COMPILE_DEFINITIONS "HAVE_PNG"
        INTERFACE_INCLUDE_DIRECTORIES "${PACKAGE_PREFIX_DIR}/include"
)
set_target_properties(
    libpng
    PROPERTIES
        INTERFACE_COMPILE_DEFINITIONS "HAVE_PNG;PNG_USE_DLL"
)

if(CMAKE_SIZEOF_VOID_P EQUAL 8)
    set_target_properties(
        libpng
        PROPERTIES
            IMPORTED_IMPLIB "${PACKAGE_PREFIX_DIR}/x64-Release/dll/libpng16.lib"
            IMPORTED_LOCATION "${PACKAGE_PREFIX_DIR}/x64-Release/dll/libpng16.dll"
    )
    set_target_properties(
        libpng_a
        PROPERTIES
            IMPORTED_LOCATION "${PACKAGE_PREFIX_DIR}/x64-Release/lib/libpng16_a.lib"
    )
elseif(CMAKE_SIZEOF_VOID_P EQUAL 4)
    set_target_properties(
        libpng
        PROPERTIES
            IMPORTED_IMPLIB "${PACKAGE_PREFIX_DIR}/x86-Release/dll/libpng16.lib"
            IMPORTED_LOCATION "${PACKAGE_PREFIX_DIR}/x86-Release/dll/libpng16.dll"
    )
    set_target_properties(
        libpng_a
        PROPERTIES
            IMPORTED_LOCATION "${PACKAGE_PREFIX_DIR}/x86-Release/lib/libpng16_a.lib"
    )
endif()
