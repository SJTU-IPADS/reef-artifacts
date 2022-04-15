project(reef)
cmake_minimum_required(VERSION 3.2)

add_compile_options(-std=c++11)
add_definitions(-D__REEF_HIP_GPU__)
add_definitions(-DRESOURCE_DIR="${CMAKE_CURRENT_LIST_DIR}/resource")


# GRPC and Protocol Buffers libraries location
list(APPEND CMAKE_PREFIX_PATH "/opt/rocm")

# Cmake find modules
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake")

# For grpc 

include("${CMAKE_CURRENT_LIST_DIR}/cmake/common.cmake")

get_filename_component(reef_proto "${CMAKE_CURRENT_LIST_DIR}/src/reef/protos/reef.proto" ABSOLUTE)
get_filename_component(reef_proto_path "${reef_proto}" PATH)
set(GRPC_GENERATE_DIR "${PROJECT_SOURCE_DIR}/src/reef/rpc" )
set(reef_proto_srcs "${GRPC_GENERATE_DIR}/reef.pb.cc")
set(reef_proto_hdrs "${GRPC_GENERATE_DIR}/reef.pb.h")
set(reef_grpc_srcs "${GRPC_GENERATE_DIR}/reef.grpc.pb.cc")
set(reef_grpc_hdrs "${GRPC_GENERATE_DIR}/reef.grpc.pb.h")
add_custom_command(
      OUTPUT "${reef_proto_srcs}" "${reef_proto_hdrs}" "${reef_grpc_srcs}" "${reef_grpc_hdrs}"
      COMMAND ${_PROTOBUF_PROTOC}
      ARGS --grpc_out "${GRPC_GENERATE_DIR}"
        --cpp_out "${GRPC_GENERATE_DIR}"
        -I "${reef_proto_path}"
        --plugin=protoc-gen-grpc="${_GRPC_CPP_PLUGIN_EXECUTABLE}"
        "${reef_proto}"
      DEPENDS "${reef_proto}")

include_directories("${GRPC_GENERATE_DIR}")

# reef_grpc_proto
add_library(reef_grpc_proto
  ${reef_grpc_srcs}
  ${reef_grpc_hdrs}
  ${reef_proto_srcs}
  ${reef_proto_hdrs})
target_link_libraries(reef_grpc_proto
  ${_REFLECTION}
  ${_GRPC_GRPCPP}
  ${_PROTOBUF_LIBPROTOBUF})


# REEF codes

find_package(hip REQUIRED)

find_package(GTest REQUIRED)

find_package(glog REQUIRED)

SET(CMAKE_CXX_COMPILER "/opt/rocm/bin/hipcc")

# find_package(CUDAToolkit REQUIRED)

set(CMAKE_CXX_FLAGS "-g -O0 ${CMAKE_CXX_FLAGS}")

include_directories(${HIP_INCLUDE_DIRS})
# include_directories(${CUDAToolkit_INCLUDE_DIRS})
include_directories("${PROJECT_SOURCE_DIR}/src")


AUX_SOURCE_DIRECTORY("${PROJECT_SOURCE_DIR}/src/reef/client" client)

AUX_SOURCE_DIRECTORY("${PROJECT_SOURCE_DIR}/src/reef/executor" executor)
AUX_SOURCE_DIRECTORY("${PROJECT_SOURCE_DIR}/src/reef/executor/hip" hip_impl)

AUX_SOURCE_DIRECTORY("${PROJECT_SOURCE_DIR}/src/reef/server" server)

AUX_SOURCE_DIRECTORY("${PROJECT_SOURCE_DIR}/src/reef/util" util)

AUX_SOURCE_DIRECTORY("${PROJECT_SOURCE_DIR}/src/reef/test" test)

add_library(reef_util
  ${util}
)

add_library(reef_server
  ${server}
  ${executor}
  ${hip_impl}
)

add_library(reef_client
  ${client}
)

add_executable(unit_test 
  ${test}
)

add_library(DISB
  "${PROJECT_SOURCE_DIR}/src/eval/DISB.cpp"
  "${PROJECT_SOURCE_DIR}/src/eval/reef_bench.cpp"
)

target_link_libraries(unit_test
    reef_util
    reef_server
    reef_client
    reef_grpc_proto
    glog::glog
    ${GTEST_BOTH_LIBRARIES}
    ${_REFLECTION}
    ${_GRPC_GRPCPP}
    ${_PROTOBUF_LIBPROTOBUF}
    pthread
)

function (add_executable_app app_name app_path)
    add_executable(${app_name}
        ${app_path}
    )
    target_link_libraries(${app_name}
      reef_util
      reef_server
      reef_client
      reef_grpc_proto
      DISB
      glog::glog
      ${GTEST_BOTH_LIBRARIES}
      ${_REFLECTION}
      ${_GRPC_GRPCPP}
      ${_PROTOBUF_LIBPROTOBUF}
      pthread
    )
endfunction()

add_executable_app(benchmark  "${PROJECT_SOURCE_DIR}/src/eval/overall.cpp")

add_executable_app(throughput  "${PROJECT_SOURCE_DIR}/src/eval/throughput.cpp")

add_executable_app(micro "${PROJECT_SOURCE_DIR}/src/eval/micro.cpp")

add_executable_app(DNN-preempt "${PROJECT_SOURCE_DIR}/src/eval/DNN-preempt.cpp")

add_executable_app(preemption "${PROJECT_SOURCE_DIR}/src/eval/preemption.cpp")

add_executable_app(kernel_size "${PROJECT_SOURCE_DIR}/src/eval/kernel_size.cpp")

add_executable_app(queue_size "${PROJECT_SOURCE_DIR}/src/eval/queue_size.cpp")

add_executable_app(tradeoff "${PROJECT_SOURCE_DIR}/src/eval/tradeoff.cpp")

add_executable_app(dkp "${PROJECT_SOURCE_DIR}/src/eval/dkp.cpp")

add_executable_app(stream "${PROJECT_SOURCE_DIR}/src/eval/stream.cpp")

add_executable_app(pointer "${PROJECT_SOURCE_DIR}/src/eval/pointer.cpp")

