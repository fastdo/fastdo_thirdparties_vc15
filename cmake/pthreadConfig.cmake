get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../" ABSOLUTE)

add_library(pthread SHARED IMPORTED)
set_target_properties(
    pthread
    PROPERTIES
    INTERFACE_COMPILE_DEFINITIONS "HAVE_PTHREAD"
    INTERFACE_INCLUDE_DIRECTORIES "${PACKAGE_PREFIX_DIR}/include"
)

if(CMAKE_SIZEOF_VOID_P EQUAL 8)
    set_target_properties(
        pthread
        PROPERTIES
        IMPORTED_IMPLIB "${PACKAGE_PREFIX_DIR}/x64-Release/dll/pthreadVC2.lib"
        IMPORTED_LOCATION "${PACKAGE_PREFIX_DIR}/x64-Release/dll/pthreadVC2.dll"
    )
elseif(CMAKE_SIZEOF_VOID_P EQUAL 4)
    set_target_properties(
        pthread
        PROPERTIES
        IMPORTED_IMPLIB "${PACKAGE_PREFIX_DIR}/x86-Release/dll/pthreadVC2.lib"
        IMPORTED_LOCATION "${PACKAGE_PREFIX_DIR}/x86-Release/dll/pthreadVC2.dll"
    )
endif()
