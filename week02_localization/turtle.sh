# get docker image (~1 Gb)
docker pull osrf/ros:noetic-desktop-full


# 1. For Linux
# start image with graphical interface forwarded to host
docker run -it -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix osrf/ros:noetic-desktop-full
# same as above but destroys container image after shutting down
docker run -it --rm --privileged --net=host -e DISPLAY=$IP:0 -v /tmp/.X11-unix:/tmp/.X11-unix osrf/ros:noetic-desktop-full

# 2. For MacOS
docker run -it -e DISPLAY=host.docker.internal:0 -v /tmp/.X11-unix:/tmp/.X11-unix osrf/ros:noetic-desktop-full
export LIBGL_ALWAYS_INDIRECT=1 # to enable rendering on host machine, not virtual

# setup ROS environment for particular shell
env | grep ROS  # <empty output>

echo $SHELL  # /bin/bash (or smth else)
source /opt/ros/noetic/setup.bash

env | grep ROS  # <some variables>


# Start ROS
roscore
# PRESS Ctrl+Z to pass roscore to background
# alternative command: `roscore &`
# to pass process to background from the start

# check roscore is in background
ps

# roscore is unique process
roscore # <warning about running roscore>


# Check logging
ls -la /root/.ros/log/<your-unique-id>/

# Alternative way to check latest log
ls -la ~/.ros/log/latest/

# Look into log file
less ~/.ros/log/latest/master.log


# Multiple terminals for one docker container
# OPEN new terminal window
docker ps # find running docker id
docker exec -it <your-docker-id> bash
source /opt/ros/noetic/setup.bash # DON'T FORGET!!!


# Start turtlesim
rosrun turtlesim turtlesim_node


# Launch rqt GUI
rqt_graph


# Moving turtle
rosrun turtlesim turtle_teleop_key


# CLI instruments
rostopic list
rosnode list
rostopic info /turtle1/cmd_vel
rosmsg info geometry_msgs/Twist
rostopic echo /turtle1/cmd_vel
# now press keys to see what happens


# Make turtle make autonomous actions
rosrun turtlesim draw_square
rostopic echo /turtle1/pose
rostopic info /turtle1/pose
rqt_graph
