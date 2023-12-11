get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../" ABSOLUTE)

add_library(libcurl SHARED IMPORTED)
add_library(libcurl_a STATIC IMPORTED)
set_target_properties(
    libcurl libcurl_a
    PROPERTIES
        INTERFACE_COMPILE_DEFINITIONS "HAVE_CURL"
        INTERFACE_INCLUDE_DIRECTORIES "${PACKAGE_PREFIX_DIR}/include"
)
list(APPEND libcurl_a_LIBS "ws2_32" "crypt32" "wldap32" "normaliz")
set_target_properties(
    libcurl_a
    PROPERTIES
        INTERFACE_COMPILE_DEFINITIONS "HAVE_CURL;CURL_STATICLIB"
        INTERFACE_LINK_LIBRARIES "${libcurl_a_LIBS}"
)

if(CMAKE_SIZEOF_VOID_P EQUAL 8)
    set_target_properties(
        libcurl
        PROPERTIES
            IMPORTED_IMPLIB "${PACKAGE_PREFIX_DIR}/x64-Release/dll/libcurl.lib"
            IMPORTED_LOCATION "${PACKAGE_PREFIX_DIR}/x64-Release/dll/libcurl.dll"
    )
    set_target_properties(
        libcurl_a
        PROPERTIES
            IMPORTED_LOCATION "${PACKAGE_PREFIX_DIR}/x64-Release/lib/libcurl_a.lib"
    )
elseif(CMAKE_SIZEOF_VOID_P EQUAL 4)
    set_target_properties(
        libcurl
        PROPERTIES
            IMPORTED_IMPLIB "${PACKAGE_PREFIX_DIR}/x86-Release/dll/libcurl.lib"
            IMPORTED_LOCATION "${PACKAGE_PREFIX_DIR}/x86-Release/dll/libcurl.dll"
    )
    set_target_properties(
        libcurl_a
        PROPERTIES
            IMPORTED_LOCATION "${PACKAGE_PREFIX_DIR}/x86-Release/lib/libcurl_a.lib"
    )
endif()
