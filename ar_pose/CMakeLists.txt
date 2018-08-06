
cmake_minimum_required(VERSION 2.8)

project(ar_pose)

find_package(catkin REQUIRED COMPONENTS
	roscpp
	visualization_msgs
	geometry_msgs
	tf
	resource_retriever
	image_transport
	cv_bridge
	message_generation
)

find_package(GLUT REQUIRED)
find_package(OpenGL REQUIRED)

add_message_files(
  DIRECTORY msg
  FILES
	ARMarker.msg
	ARMarkers.msg
)

generate_messages(DEPENDENCIES
	geometry_msgs
)

catkin_package(
  INCLUDE_DIRS include 
  CATKIN_DEPENDS
    roscpp
    geometry_msgs
    visualization_msgs
    message_runtime
)

include_directories(${catkin_INCLUDE_DIRS} include)
set(ARTOOLKIT_LIBRARY libAR.a libARgsub.a libARgsub_lite.a libARvideo.a libARMulti.a libARgsubUtil.a)

add_executable(ar_single
	src/ar_single.cpp
	src/object.cpp
)
target_link_libraries(ar_single
	${catkin_LIBRARIES}
        ${ARTOOLKIT_LIBRARY}
)
add_dependencies(ar_single
	${PROJECT_NAME}_generate_messages_cpp
	${artoolkit_EXPORTED_TARGETS}
)

add_executable(ar_multi
	src/ar_multi.cpp
	src/object.cpp
)
target_link_libraries(ar_multi
	${catkin_LIBRARIES}
        ${OPENGL_LIBRARIES}
        ${GLUT_LIBRARY}
        ${OPENGL_gl_LIBRARY}
        ${ARTOOLKIT_LIBRARY}
        -lGL
        -lGLU
        -lglut
)
add_dependencies(ar_multi
	${PROJECT_NAME}_generate_messages_cpp
	${artoolkit_EXPORTED_TARGETS}
)

# Install
foreach(modules ar_single ar_multi)
  install(TARGETS ${module}
    RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
  )
endforeach(modules)

foreach(dir launch demo data)
  install(DIRECTORY ${dir}/
    DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/${dir})
endforeach(dir)

# Test
if (CATKIN_ENABLE_TESTING)
  find_package(roslaunch REQUIRED)
  roslaunch_add_file_check(launch/ar_pose_multi.launch)
  roslaunch_add_file_check(launch/ar_pose_reverse.launch)
  roslaunch_add_file_check(launch/ar_pose_single.launch)
endif()
