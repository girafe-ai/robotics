# Start in your virtual machine or docker container with ros
sudo apt install build-essential ros-melodic-desktop-full
source /opt/ros/melodic/setup.bash

# Create dir for project. Just repeat of previous seminar
mkdir second_workspace
cd second_workspace
mkdir src
catkin_make
source devel/setup.bash
cd src
catkin_create_pkg second_package rospy std_msgs
# Add code files
mv /signal_generator_node.py second_package/src
mv /signal_filter_node.py second_package/src
chmod +x second_package/src/signal_generator_node.py
chmod +x second_package/src/signal_filter_node.py

# NEW: create custom messages
mkdir second_package/msg
mv /Signal.msg second_package/msg/

# Add to package.xml:
# <build_depend>message_generation</build_depend>
# <exec_depend>message_runtime</exec_depend>

# Add to package CMakeLists.txt:
# find_package(catkin REQUIRED COMPONENTS
#    roscpp
#    rospy
#    std_msgs
#    message_generation
# )

# And to the same file below:
# catkin_package(
#   ...
#   CATKIN_DEPENDS message_runtime ...
#   ...
# )

# Uncomment directive:
# add_message_files(
#     FILES
#     signal.msg
# )

# Uncomment generating messages:
# generate_messages(
#     DEPENDENCIES
#     std_msgs
# )

# Check package is building well
cd ..
catkin_make

# Look at our beautiful message!
rosmsg show second_package/Signal

# Launch ROS and new nodes
roscore
# Ctrl + Z (or another terminal)
rosrun second_package signal_generator_node.py
# Ctrl + Z (or another terminal)
rosrun second_package signal_filter_node.py

rostopic info /signal


# Setup own service
# Copy service description to appropriate dir
mkdir src/second_package/srv
cp /GetWindowMedian.srv src/second_package/srv
# Compile new service to ROS
catkin_make

# Update source files to expose service (add handle_get_median)
# Restart nodes in terminal

rossrv show second_package/GetWindowMedian
rosservice list
rosservice call /get_median "{}"
