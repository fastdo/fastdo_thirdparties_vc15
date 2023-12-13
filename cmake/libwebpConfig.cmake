get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../" ABSOLUTE)

add_library(libwebp_a STATIC IMPORTED)
add_library(libwebpdecoder_a STATIC IMPORTED)
add_library(libwebpdemux_a STATIC IMPORTED)

set_target_properties(
    libwebp_a libwebpdecoder_a libwebpdemux_a
    PROPERTIES
        INTERFACE_COMPILE_DEFINITIONS "HAVE_WEBP"
)
set_property(TARGET libwebp_a libwebpdecoder_a libwebpdemux_a PROPERTY IMPORTED_CONFIGURATIONS "DEBUG;RELEASE;RELWITHDEBINFO;MINSIZEREL")
if(CMAKE_SIZEOF_VOID_P EQUAL 8)
    set_target_properties(
        libwebp_a libwebpdecoder_a libwebpdemux_a
        PROPERTIES
            INTERFACE_INCLUDE_DIRECTORIES "${PACKAGE_PREFIX_DIR}/libraries/third_deps/x64/include"
    )
    set_target_properties(
        libwebp_a
        PROPERTIES
            IMPORTED_LOCATION_DEBUG "${PACKAGE_PREFIX_DIR}/libraries/third_deps/x64/lib/libwebp_a_debug.lib"
            IMPORTED_LOCATION_RELWITHDEBINFO "${PACKAGE_PREFIX_DIR}/libraries/third_deps/x64/lib/libwebp_a_debug.lib"
            IMPORTED_LOCATION_RELEASE "${PACKAGE_PREFIX_DIR}/libraries/third_deps/x64/lib/libwebp_a.lib"
            IMPORTED_LOCATION_MINSIZEREL "${PACKAGE_PREFIX_DIR}/libraries/third_deps/x64/lib/libwebp_a.lib"
    )
    set_target_properties(
        libwebpdecoder_a
        PROPERTIES
            IMPORTED_LOCATION_DEBUG "${PACKAGE_PREFIX_DIR}/libraries/third_deps/x64/lib/libwebpdecoder_a_debug.lib"
            IMPORTED_LOCATION_RELWITHDEBINFO "${PACKAGE_PREFIX_DIR}/libraries/third_deps/x64/lib/libwebpdecoder_a_debug.lib"
            IMPORTED_LOCATION_RELEASE "${PACKAGE_PREFIX_DIR}/libraries/third_deps/x64/lib/libwebpdecoder_a.lib"
            IMPORTED_LOCATION_MINSIZEREL "${PACKAGE_PREFIX_DIR}/libraries/third_deps/x64/lib/libwebpdecoder_a.lib"
    )
    set_target_properties(
        libwebpdemux_a
        PROPERTIES
            IMPORTED_LOCATION_DEBUG "${PACKAGE_PREFIX_DIR}/libraries/third_deps/x64/lib/libwebpdemux_a_debug.lib"
            IMPORTED_LOCATION_RELWITHDEBINFO "${PACKAGE_PREFIX_DIR}/libraries/third_deps/x64/lib/libwebpdemux_a_debug.lib"
            IMPORTED_LOCATION_RELEASE "${PACKAGE_PREFIX_DIR}/libraries/third_deps/x64/lib/libwebpdemux_a.lib"
            IMPORTED_LOCATION_MINSIZEREL "${PACKAGE_PREFIX_DIR}/libraries/third_deps/x64/lib/libwebpdemux_a.lib"
    )
elseif(CMAKE_SIZEOF_VOID_P EQUAL 4)
    set_target_properties(
        libwebp_a libwebpdecoder_a libwebpdemux_a
        PROPERTIES
            INTERFACE_INCLUDE_DIRECTORIES "${PACKAGE_PREFIX_DIR}/libraries/third_deps/x86/include"
    )
    set_target_properties(
        libwebp_a
        PROPERTIES
            IMPORTED_LOCATION_DEBUG "${PACKAGE_PREFIX_DIR}/libraries/third_deps/x86/lib/libwebp_a_debug.lib"
            IMPORTED_LOCATION_RELWITHDEBINFO "${PACKAGE_PREFIX_DIR}/libraries/third_deps/x86/lib/libwebp_a_debug.lib"
            IMPORTED_LOCATION_RELEASE "${PACKAGE_PREFIX_DIR}/libraries/third_deps/x86/lib/libwebp_a.lib"
            IMPORTED_LOCATION_MINSIZEREL "${PACKAGE_PREFIX_DIR}/libraries/third_deps/x86/lib/libwebp_a.lib"
    )
    set_target_properties(
        libwebpdecoder_a
        PROPERTIES
            IMPORTED_LOCATION_DEBUG "${PACKAGE_PREFIX_DIR}/libraries/third_deps/x86/lib/libwebpdecoder_a_debug.lib"
            IMPORTED_LOCATION_RELWITHDEBINFO "${PACKAGE_PREFIX_DIR}/libraries/third_deps/x86/lib/libwebpdecoder_a_debug.lib"
            IMPORTED_LOCATION_RELEASE "${PACKAGE_PREFIX_DIR}/libraries/third_deps/x86/lib/libwebpdecoder_a.lib"
            IMPORTED_LOCATION_MINSIZEREL "${PACKAGE_PREFIX_DIR}/libraries/third_deps/x86/lib/libwebpdecoder_a.lib"
    )
    set_target_properties(
        libwebpdemux_a
        PROPERTIES
            IMPORTED_LOCATION_DEBUG "${PACKAGE_PREFIX_DIR}/libraries/third_deps/x86/lib/libwebpdemux_a_debug.lib"
            IMPORTED_LOCATION_RELWITHDEBINFO "${PACKAGE_PREFIX_DIR}/libraries/third_deps/x86/lib/libwebpdemux_a_debug.lib"
            IMPORTED_LOCATION_RELEASE "${PACKAGE_PREFIX_DIR}/libraries/third_deps/x86/lib/libwebpdemux_a.lib"
            IMPORTED_LOCATION_MINSIZEREL "${PACKAGE_PREFIX_DIR}/libraries/third_deps/x86/lib/libwebpdemux_a.lib"
    )
endif()
