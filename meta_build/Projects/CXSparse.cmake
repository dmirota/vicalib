#set(EP_REQUIRED_PROJECTS)
set(EP_URL "https://github.com/TheFrenchLeaf/CXSparse.git")
set(EP_TAG 26040d5425fc5300b8e0a40b212ff1846b073629)


cma_end_definition()

if("${CMAKE_BUILD_TYPE}" MATCHES "RelWithDebInfo")
  set(CMAKE_BUILD_TYPE "Release")
endif()

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
)


ExternalProject_Add(${EP_NAME}
  DEPENDS ${EP_REQUIRED_PROJECTS}
  GIT_REPOSITORY  ${EP_URL}
  GIT_TAG ${EP_TAG}
  UPDATE_DISCONNECTED 1
  SOURCE_DIR ${PROJECT_BINARY_DIR}/src/${EP_NAME}
  CMAKE_ARGS ${EP_CMAKE_ARGS}
  BINARY_DIR ${PROJECT_BINARY_DIR}/${EP_NAME}-build
  INSTALL_COMMAND "")

 #set(${EP_NAME}_DIR "${PROJECT_BINARY_DIR}/install/lib/cmake/${EP_NAME}" CACHE INTERNAL "")
 
 set(CXSPARSE_INCLUDE_DIR  ${PROJECT_BINARY_DIR}/src/${EP_NAME}/Include CACHE INTERNAL "")
 
 set(CONFIG)
 if(MSVC AND NOT ${CMAKE_GENERATOR} MATCHES "Ninja")
  set(CONFIG "$(Configuration)/")
 endif()

 set(CXSPARSE_LIBRARY ${PROJECT_BINARY_DIR}/${EP_NAME}-build/${CONFIG}${CMAKE_STATIC_LIBRARY_PREFIX}cxsparse${CMAKE_STATIC_LIBRARY_SUFFIX} CACHE INTERNAL "")
