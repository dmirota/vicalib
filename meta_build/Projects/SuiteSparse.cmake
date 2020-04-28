#set(EP_REQUIRED_PROJECTS)
set(EP_URL "https://github.com/jlblancoc/suitesparse-metis-for-windows.git")
set(EP_TAG v1.5.0)


cma_end_definition()

if("${CMAKE_BUILD_TYPE}" MATCHES "RelWithDebInfo")
  set(CMAKE_BUILD_TYPE "Release")
endif()

string(REPLACE ";" "$<SEMICOLON>" BLAS_LIBRARIES_ALT_SEP "${BLAS_LIBRARIES}")

set(EP_CMAKE_ARGS
  -DCMAKE_USER_MAKE_RULES_OVERRIDE:FILEPATH=${CMAKE_USER_MAKE_RULES_OVERRIDE}
  -DCMAKE_USER_MAKE_RULES_OVERRIDE_CXX:FILEPATH=${CMAKE_USER_MAKE_RULES_OVERRIDE_CXX}
  -DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}
  -DCMAKE_C_FLAGS:STRING=${CMAKE_C_FLAGS}
  -DCMAKE_CXX_FLAGS:STRING=${CMAKE_CXX_FLAGS}
  -DCMAKE_TOOLCHAIN_FILE:FILEPATH=${CMAKE_TOOLCHAIN_FILE}
  -DCMAKE_ANDROID_NDK:PATH=${CMAKE_ANDROID_NDK}
  -DCMAKE_ANDROID_ARCH_ABI:STRING=${CMAKE_ANDROID_ARCH_ABI}
  -DCMAKE_ANDROID_NDK_TOOLCHAIN_VERSION:STRING=${CMAKE_ANDROID_NDK_TOOLCHAIN_VERSION}
  -DCMAKE_C_COMPILER_LAUNCHER:FILEPATH=${CMAKE_C_COMPILER_LAUNCHER}
  -DCMAKE_CXX_COMPILER_LAUNCHER:FILEPATH=${CMAKE_CXX_COMPILER_LAUNCHER}
  -DBUILD_METIS:BOOL=OFF
  -DBLAS_LIBRARIES=${BLAS_LIBRARIES_ALT_SEP}
  -DLAPACK_LIBRARIES=${BLAS_LIBRARIES_ALT_SEP}
  -DBLA_STATIC:BOOL=TRUE
  -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
)


ExternalProject_Add(${EP_NAME}
  DEPENDS ${EP_REQUIRED_PROJECTS}
  GIT_REPOSITORY  ${EP_URL}
  GIT_TAG ${EP_TAG}
  UPDATE_DISCONNECTED 1
  SOURCE_DIR ${PROJECT_BINARY_DIR}/src/${EP_NAME}
  CMAKE_ARGS ${EP_CMAKE_ARGS}
  BINARY_DIR ${PROJECT_BINARY_DIR}/${EP_NAME}-build
  INSTALL_DIR ${PROJECT_BINARY_DIR}/install)

 #set(${EP_NAME}_DIR "${PROJECT_BINARY_DIR}/install/lib/cmake/${EP_NAME}" CACHE INTERNAL "")
 
 set(SUITESPARSE_INCLUDE_DIR_HINTS ${PROJECT_BINARY_DIR}/install/include/suitesparse CACHE INTERNAL "")
 
 set(SUITESPARSE_LIBRARY_DIR_HINTS ${PROJECT_BINARY_DIR}/install/lib CACHE INTERNAL "")