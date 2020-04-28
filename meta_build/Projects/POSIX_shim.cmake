set(EP_REQUIRED_PROJECTS)

cma_end_definition()

set(EP_CMAKE_ARGS
    -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
)

ExternalProject_Add(${EP_NAME}
  DEPENDS ${EP_REQUIRED_PROJECTS}
  DOWNLOAD_COMMAND ""
  SOURCE_DIR ${PROJECT_SOURCE_DIR}/POSIX_shim
  CMAKE_ARGS ${EP_CMAKE_ARGS}
  BUILD_COMMAND ""
  INSTALL_DIR ${PROJECT_BINARY_DIR}/src)