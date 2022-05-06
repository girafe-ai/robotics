# Start in your virtual machine or docker container with ros
sudo apt install build-essential ros-melodic-desktop-full
source /opt/ros/melodic/setup.bash

# Create dir for project
mkdir first_workspace
cd first_workspace
mkdir src

# First invocation of this command creates infrastructure for your ROS project
catkin_make  # juicy output

# Add your workspace infrastructure to environment and note difference
env | grep ROS
source devel/setup.bash
env | grep ROS

# Create package in workspace
cd src
catkin_create_pkg first_package rospy std_msgs  # juicy output
# inspect contents
ls first_package
less first_package/package.xml

# Open file wiht some editor e.g. VSCode
code . --user-data-dir=/vscode

# Add code files
mv /signal_generator_node.py first_package/src
mv /signal_filter_node.py first_package/src

# make executable
chmod +x first_package/src/signal_generator_node.py
chmod +x first_package/src/signal_filter_node.py

# Check package is building well
cd ..
catkin_make

# Launch ROS and new nodes
roscore
# Ctrl + Z (or another terminal)
rosrun first_package signal_generator_node.py
rosrun first_package signal_filter_node.py

# Analyze package
rostopic list
rostopic info /signal
rostopic hz /signal

# Visualize topics
rqt_graph

# Visualize topic contents on plot
rqt_plot
