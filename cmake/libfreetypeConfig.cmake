get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../" ABSOLUTE)

add_library(libfreetype_a STATIC IMPORTED)

set_target_properties(
    libfreetype_a
    PROPERTIES
        INTERFACE_COMPILE_DEFINITIONS "HAVE_FREETYPE"
)
set_property(TARGET libfreetype_a PROPERTY IMPORTED_CONFIGURATIONS "DEBUG;RELEASE;RELWITHDEBINFO;MINSIZEREL")
if(CMAKE_SIZEOF_VOID_P EQUAL 8)
    set_target_properties(
        libfreetype_a
        PROPERTIES
            INTERFACE_INCLUDE_DIRECTORIES "${PACKAGE_PREFIX_DIR}/libraries/third_deps/x64/include"
    )
    set_target_properties(
        libfreetype_a
        PROPERTIES
            IMPORTED_LOCATION_DEBUG "${PACKAGE_PREFIX_DIR}/libraries/third_deps/x64/lib/freetype_a_debug.lib"
            IMPORTED_LOCATION_RELWITHDEBINFO "${PACKAGE_PREFIX_DIR}/libraries/third_deps/x64/lib/freetype_a_debug.lib"
            IMPORTED_LOCATION_RELEASE "${PACKAGE_PREFIX_DIR}/libraries/third_deps/x64/lib/freetype_a.lib"
            IMPORTED_LOCATION_MINSIZEREL "${PACKAGE_PREFIX_DIR}/libraries/third_deps/x64/lib/freetype_a.lib"
    )
elseif(CMAKE_SIZEOF_VOID_P EQUAL 4)
    set_target_properties(
        libfreetype_a
        PROPERTIES
            INTERFACE_INCLUDE_DIRECTORIES "${PACKAGE_PREFIX_DIR}/libraries/third_deps/x86/include"
    )
    set_target_properties(
        libfreetype_a
        PROPERTIES
            IMPORTED_LOCATION_DEBUG "${PACKAGE_PREFIX_DIR}/libraries/third_deps/x86/lib/freetype_a_debug.lib"
            IMPORTED_LOCATION_RELWITHDEBINFO "${PACKAGE_PREFIX_DIR}/libraries/third_deps/x86/lib/freetype_a_debug.lib"
            IMPORTED_LOCATION_RELEASE "${PACKAGE_PREFIX_DIR}/libraries/third_deps/x86/lib/freetype_a.lib"
            IMPORTED_LOCATION_MINSIZEREL "${PACKAGE_PREFIX_DIR}/libraries/third_deps/x86/lib/freetype_a.lib"
    )
endif()
