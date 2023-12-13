get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../" ABSOLUTE)

add_library(libjpeg_a STATIC IMPORTED)
set_target_properties(
    libjpeg_a
    PROPERTIES
        INTERFACE_COMPILE_DEFINITIONS "HAVE_JPEG"
        INTERFACE_INCLUDE_DIRECTORIES "${PACKAGE_PREFIX_DIR}/include"
)

if(CMAKE_SIZEOF_VOID_P EQUAL 8)
    set_target_properties(
        libjpeg_a
        PROPERTIES
            IMPORTED_LOCATION "${PACKAGE_PREFIX_DIR}/x64-Release/lib/jpeg.lib"
    )
elseif(CMAKE_SIZEOF_VOID_P EQUAL 4)
    set_target_properties(
        libjpeg_a
        PROPERTIES
            IMPORTED_LOCATION "${PACKAGE_PREFIX_DIR}/x86-Release/lib/jpeg.lib"
    )
endif()
