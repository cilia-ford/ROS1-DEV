cmake_minimum_required(VERSION 3.8)
project(control_package)

if(CMAKE_CXX_COMPILER_ID MATCHES "(GNU|Clang)")
  add_compile_options(-Wall -Wextra -Werror=conversion -Werror=unused-but-set-variable -Werror=return-type -Werror=shadow)
endif()

# find dependencies
find_package(ament_cmake REQUIRED)
find_package(hardware_interface REQUIRED)
find_package(pluginlib REQUIRED)
find_package(rclcpp REQUIRED)
find_package(rclcpp_lifecycle REQUIRED)

add_library(
  control_package
  SHARED
  src/my_cool_robot_hardware_interface.cpp
)
target_include_directories(
  control_package
  PUBLIC
  include
)
ament_target_dependencies(
  control_package
  hardware_interface
  rclcpp
  rclcpp_lifecycle
)
# prevent pluginlib from using boost
target_compile_definitions(control_package PUBLIC "PLUGINLIB__DISABLE_BOOST_FUNCTIONS")

pluginlib_export_plugin_description_file(
  hardware_interface control_package.xml)

install(
  TARGETS
  control_package
  RUNTIME DESTINATION bin
  ARCHIVE DESTINATION lib
  LIBRARY DESTINATION lib
)

install(
  DIRECTORY include/
  DESTINATION include
)

if(BUILD_TESTING)

  ament_add_gmock(test_my_cool_robot_hardware_interface test/test_my_cool_robot_hardware_interface.cpp)
  target_include_directories(test_my_cool_robot_hardware_interface PRIVATE include)
  ament_target_dependencies(
    test_my_cool_robot_hardware_interface
    hardware_interface
    pluginlib
    ros2_control_test_assets
  )
endif()

ament_export_include_directories(
  include
)
ament_export_libraries(
  control_package
)
ament_export_dependencies(
  hardware_interface
  pluginlib
  rclcpp
  rclcpp_lifecycle
)

ament_package()
