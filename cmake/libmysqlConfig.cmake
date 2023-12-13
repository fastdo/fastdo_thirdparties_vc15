get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../" ABSOLUTE)

add_library(libmysql SHARED IMPORTED)
set_target_properties(
    libmysql
    PROPERTIES
        INTERFACE_COMPILE_DEFINITIONS "HAVE_MYSQL"
)

if(CMAKE_SIZEOF_VOID_P EQUAL 8)
    set(MYSQL64_ROOT $ENV{MYSQL64_ROOT})
    if(NOT MYSQL64_ROOT)
        message(FATAL_ERROR "\$ENV{MYSQL64_ROOT} is not found.")
    endif()
    set_target_properties(
        libmysql
        PROPERTIES
            INTERFACE_INCLUDE_DIRECTORIES "${MYSQL64_ROOT}/include"
            IMPORTED_IMPLIB "${MYSQL64_ROOT}/lib/libmysql.lib"
            IMPORTED_LOCATION "${MYSQL64_ROOT}/bin/libmysql.dll"
    )
elseif(CMAKE_SIZEOF_VOID_P EQUAL 4)
    set(MYSQL32_ROOT $ENV{MYSQL32_ROOT})
    if(NOT MYSQL32_ROOT)
        message(FATAL_ERROR "\$ENV{MYSQL32_ROOT} is not found.")
    endif()
    set_target_properties(
        libmysql
        PROPERTIES
            INTERFACE_INCLUDE_DIRECTORIES "${MYSQL32_ROOT}/include"
            IMPORTED_IMPLIB "${MYSQL32_ROOT}/lib/libmysql.lib"
            IMPORTED_LOCATION "${MYSQL32_ROOT}/bin/libmysql.dll"
    )
endif()
