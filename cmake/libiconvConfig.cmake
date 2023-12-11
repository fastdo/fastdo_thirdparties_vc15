get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../" ABSOLUTE)

add_library(libiconv SHARED IMPORTED)
add_library(libiconv_a STATIC IMPORTED)
set_target_properties(
    libiconv libiconv_a
    PROPERTIES
        INTERFACE_COMPILE_DEFINITIONS "HAVE_ICONV"
        INTERFACE_INCLUDE_DIRECTORIES "${PACKAGE_PREFIX_DIR}/include"
)

if(CMAKE_SIZEOF_VOID_P EQUAL 8)
    set_target_properties(
        libiconv
        PROPERTIES
            IMPORTED_IMPLIB "${PACKAGE_PREFIX_DIR}/x64-Release/dll/iconv.dll.lib"
            IMPORTED_LOCATION "${PACKAGE_PREFIX_DIR}/x64-Release/dll/iconv-2.dll"
    )
    set_target_properties(
        libiconv_a
        PROPERTIES
            IMPORTED_LOCATION "${PACKAGE_PREFIX_DIR}/x64-Release/lib/iconv.lib"
    )
elseif(CMAKE_SIZEOF_VOID_P EQUAL 4)
    set_target_properties(
        libiconv
        PROPERTIES
            IMPORTED_IMPLIB "${PACKAGE_PREFIX_DIR}/x86-Release/dll/iconv.dll.lib"
            IMPORTED_LOCATION "${PACKAGE_PREFIX_DIR}/x86-Release/dll/iconv-2.dll"
    )
    set_target_properties(
        libiconv_a
        PROPERTIES
            IMPORTED_LOCATION "${PACKAGE_PREFIX_DIR}/x86-Release/lib/iconv.lib"
    )
endif()
