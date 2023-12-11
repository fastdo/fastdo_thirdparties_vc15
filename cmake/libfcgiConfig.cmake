get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../" ABSOLUTE)

add_library(libfcgi SHARED IMPORTED)
add_library(libfcgi_a STATIC IMPORTED)
set_target_properties(
    libfcgi libfcgi_a
    PROPERTIES
        INTERFACE_COMPILE_DEFINITIONS "HAVE_FCGI"
        INTERFACE_INCLUDE_DIRECTORIES "${PACKAGE_PREFIX_DIR}/include"
)
set_target_properties(
    libfcgi_a
    PROPERTIES
        INTERFACE_COMPILE_DEFINITIONS "HAVE_FCGI;DLLAPI="
        INTERFACE_LINK_LIBRARIES "ws2_32"
)

if(CMAKE_SIZEOF_VOID_P EQUAL 8)
    set_target_properties(
        libfcgi
        PROPERTIES
            IMPORTED_IMPLIB "${PACKAGE_PREFIX_DIR}/x64-Release/dll/libfcgi.lib"
            IMPORTED_LOCATION "${PACKAGE_PREFIX_DIR}/x64-Release/dll/libfcgi.dll"
    )
    set_target_properties(
        libfcgi_a
        PROPERTIES
            IMPORTED_LOCATION "${PACKAGE_PREFIX_DIR}/x64-Release/lib/libfcgi_static.lib"
    )
elseif(CMAKE_SIZEOF_VOID_P EQUAL 4)
    set_target_properties(
        libfcgi
        PROPERTIES
            IMPORTED_IMPLIB "${PACKAGE_PREFIX_DIR}/x86-Release/dll/libfcgi.lib"
            IMPORTED_LOCATION "${PACKAGE_PREFIX_DIR}/x86-Release/dll/libfcgi.dll"
    )
    set_target_properties(
        libfcgi_a
        PROPERTIES
            IMPORTED_LOCATION "${PACKAGE_PREFIX_DIR}/x86-Release/lib/libfcgi_static.lib"
    )
endif()
