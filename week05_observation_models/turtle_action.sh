# Based on tutorial page http://wiki.ros.org/actionlib_tutorials/Tutorials/Calling%20Action%20Server%20without%20Action%20Client

# Start ROS
roscore
# and turtle
rosrun turtlesim turtlesim_node
# and readymade actioin server
rosrun turtle_actionlib shape_server

# Check everything has created
rostopic list
rqt_graph

# Send task to action server
rostopic pub /turtle_shape/goal turtle_actionlib/ShapeActionGoal
# here press <tab> to autofill all the info and set:
# edges: 3
# radius: 1.0

# At another terminal!!
# Look at result
rostopic echo /turtle_shape/result
rostopic echo /turtle_shape/feedback
# hit goal one more time
rostopic pub /turtle_shape/goal ....


# Update signal_filter_node.py to use paramter
rosparam set /window_size 10
rosparam get /window_size 10
rosrun second_package signal_generator_node.py
# Ctrl + Z (or another terminal)
rosrun second_package signal_filter_node.py

# look at changed result
rqt_plot


# Launch file createion
mkdir src/second_package/launch
mv /signal_pipeline.launch src/second_package/launch

# Start process with launch file
roslaunch second_package signal_pipeline.launch

# Check everything created
rostopic echo /filtered_signal
rqt_graph
