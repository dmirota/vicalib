set(EP_REQUIRED_PROJECTS Eigen GLEW FreeGLUT)
set(EP_URL "https://github.com/arpg/Pangolin")

set(EP_PATCH "${CMAKE_CURRENT_LIST_DIR}/${EP_NAME}.patch")

cma_end_definition()

set(EP_CMAKE_ARGS
  -DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}
  -DCMAKE_C_FLAGS:STRING=${CMAKE_C_FLAGS}
  -DCMAKE_CXX_FLAGS:STRING=${CMAKE_CXX_FLAGS}
  -DCMAKE_INSTALL_RPATH:PATH=${CMAKE_INSTALL_RPATH}
  -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
  -DBUILD_SHARED_LIBS:BOOL=ON
  -DBUILD_EXAMPLES:BOOL=OFF
  -Dglew_DIR:PATH=${glew_DIR}
  -DFreeGLUT_DIR:PATH=${FreeGLUT_DIR}
  -DEIGEN3_INCLUDE_DIR:PATH=${EIGEN_INCLUDE_DIR}
  -DFORCE_FREEGLUT:BOOL=TRUE
  -DBUILD_WITH_CVARS:BOOL=FALSE
  -DBUILD_WITH_PNG:BOOL=FALSE
  -DBUILD_WITH_JPEG:BOOL=FALSE
  -DBUILD_WITH_TIFF:BOOL=FALSE
  -DCMAKE_C_COMPILER_LAUNCHER:FILEPATH=${CMAKE_C_COMPILER_LAUNCHER}
  -DCMAKE_CXX_COMPILER_LAUNCHER:FILEPATH=${CMAKE_CXX_COMPILER_LAUNCHER})
   


ExternalProject_Add(${EP_NAME}
  DEPENDS ${EP_REQUIRED_PROJECTS}
  GIT_REPOSITORY  ${EP_URL}
  GIT_TAG e88a9dd568857261cebf5c8bdb3f19f91deaa308
  UPDATE_DISCONNECTED 1
  SOURCE_DIR ${PROJECT_BINARY_DIR}/src/${EP_NAME}
  CMAKE_ARGS ${EP_CMAKE_ARGS}
  BINARY_DIR ${PROJECT_BINARY_DIR}/${EP_NAME}-build
  INSTALL_DIR ${PROJECT_BINARY_DIR}/install)

set(${EP_NAME}_DIR "${PROJECT_BINARY_DIR}/install/lib/cmake/${EP_NAME}" CACHE INTERNAL "")
set(${EP_NAME}_LIBRARY_DIRS "${PROJECT_BINARY_DIR}/install/lib" CACHE INTERNAL "")
