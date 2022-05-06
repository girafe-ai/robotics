source /opt/ros/melodic/setup.bash

sudo apt update
sudo apt install ros-melodic-turtlebot3
cd first_workspace/src
# change branch to your ROS version instead of `melodic-devel`
git clone -b melodic-devel https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git
cd ..
catkin_make
source devel/setup.bash


# First terminal:
# TB3_MODEL: burger, waffle, waffle_pi - choose your
export TURTLEBOT3_MODEL=burger
roslaunch turtlebot3_fake turtlebot3_fake.launch

# Second terminal:
export TURTLEBOT3_MODEL=burger
roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch

# Third terminal:
rqt
# Go to Visualization -> TF Tree


# First terminal:
export TURTLEBOT3_MODEL=waffle_pi
roslaunch turtlebot3_gazebo turtlebot3_house.launch
# Second terminal:
export TURTLEBOT3_MODEL=waffle_pi
roslaunch turtlebot3_gazebo turtlebot3_simulation.launch
# Third terminal:
export TURTLEBOT3_MODEL=waffle_pi
roslaunch turtlebot3_gazebo turtlebot3_gazebo_rviz.launch
