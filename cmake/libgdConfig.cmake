get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../" ABSOLUTE)

add_library(libgd SHARED IMPORTED)
add_library(libgd_a STATIC IMPORTED)
set_target_properties(
    libgd libgd_a
    PROPERTIES
        INTERFACE_COMPILE_DEFINITIONS "HAVE_GD"
        INTERFACE_INCLUDE_DIRECTORIES "${PACKAGE_PREFIX_DIR}/include"
)
set_target_properties(
    libgd_a
    PROPERTIES
        INTERFACE_COMPILE_DEFINITIONS "HAVE_GD;BGDWIN32;NONDLL"
)

if(CMAKE_SIZEOF_VOID_P EQUAL 8)
    set_target_properties(
        libgd
        PROPERTIES
            IMPORTED_IMPLIB "${PACKAGE_PREFIX_DIR}/x64-Release/dll/libgd.lib"
            IMPORTED_LOCATION "${PACKAGE_PREFIX_DIR}/x64-Release/dll/libgd.dll"
    )
    set_target_properties(
        libgd_a
        PROPERTIES
            IMPORTED_LOCATION "${PACKAGE_PREFIX_DIR}/x64-Release/lib/libgd_a.lib"
    )
elseif(CMAKE_SIZEOF_VOID_P EQUAL 4)
    set_target_properties(
        libgd
        PROPERTIES
            IMPORTED_IMPLIB "${PACKAGE_PREFIX_DIR}/x86-Release/dll/libgd.lib"
            IMPORTED_LOCATION "${PACKAGE_PREFIX_DIR}/x86-Release/dll/libgd.dll"
    )
    set_target_properties(
        libgd_a
        PROPERTIES
            IMPORTED_LOCATION "${PACKAGE_PREFIX_DIR}/x86-Release/lib/libgd_a.lib"
    )
endif()
