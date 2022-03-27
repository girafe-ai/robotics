# Mobile robotics course by girafe-ai team

Course is currently thought at MIPT's MSAI program and in MADE mail.ru

## Install ROS for this course

In our course we will use only Python and no hardware, so setup needed is a
computing part (without sensors and actuators).

Thus we have following options:

1. Docker machine (the most simple and convenient, recommended)
1. Classical virtual machine (recommended as backup to Docker)
1. Cloud virtual machine with GUI (experimental)
1. Installation on host machine (not recommended)

### Docker

Suppose you have Docker installed, if no - follow
[official instructions](https://docs.docker.com/get-docker/)

We will use prebuilt
[osrf/ros:noetic-desktop-full](https://hub.docker.com/layers/ros/osrf/ros/noetic-desktop-full/images/sha256-9cb69b409a9a93c8bfa4faacf9b27bf705ce182021cb26c2a9667bb5c5513a67?context=explore)
Docker image. FYI
[Dockerfile source](<(https://github.com/osrf/docker_images/blob/master/ros/noetic/ubuntu/focal/desktop-full/Dockerfile)>).

1. Pull Docker container (~1Gb)<br> `docker pull osrf/ros:noetic-desktop-full`

### Ubuntu

1. Allow localhost to acess display:<br> `xhost +local:docker`
1. Run Docker with display forwarding<br>
   `docker run -it --rm --privileged --net=host -e DISPLAY=$IP:0 -v /tmp/.X11-unix:/tmp/.X11-unix osrf/ros:noetic-desktop-full`

#### MacOS

1. Install Xquartz:<br> `brew install xquartz`<br> or manually with `.dmg` from
   [official site](https://www.xquartz.org/)
1. Run Xquartz, go to _Preferences > Security > Allow connections from network
   clients_, close Xquartz.
1. Allow localhost to acess display:<br> `xhost +127.0.0.1`
1. Run Docker with display forwarding<br>
   `docker run -it --rm --privileged --net=host -e DISPLAY=$IP:0 -v /tmp/.X11-unix:/tmp/.X11-unix osrf/ros:noetic-desktop-full`

If you have troubles follow
[full instruction](https://desertbot.io/blog/ros-turtlesim-beginners-guide-mac).

#### Windows

1. Instal X Server.<br>
   [Download here](https://sourceforge.net/projects/vcxsrv/),
   [more detailed instruction here](https://dev.to/darksmile92/run-gui-app-in-linux-docker-container-on-windows-host-4kde).
1. Run Docker with display forwarding<br>
   `docker run -it -e DISPLAY=host.docker.internal:0 osrf/ros:noetic-desktop-full`

Tested on Windows 10 + WSL 2.

You could setup host VSCode to be able to edit files in running Docker image:
[instruction](https://www.cloudsavvyit.com/12837/how-to-edit-code-in-docker-containers-with-visual-studio-code/).

[Offifial Docker installation instruction](http://wiki.ros.org/docker/Tutorials/Docker) -
very concise and missing details.

## Virtual machine

Install [Virtualbox](https://www.virtualbox.org/wiki/Downloads) or
[Parallels Desktop](https://www.parallels.com/products/desktop/) (recommeded for
MacOS, not free).

Then create and launch Ubuntu instance.

Then follow regular installation on Ubuntu host (see [Host section](#host))

## Cloud virtual machine with GUI

[Follow instructions](https://dev.to/easyawslearn/how-to-setup-gui-on-amazon-ec2-ubuntu-server-4mgn)
for AWS.

Then follow regular installation on Ubuntu host (see [Host section](#host))

This is tested only once on Windows (RDP is available for MacSO tooo). If you
prefer that way - please report your experience.

## Host

Follow
[installation guide for ROS on Ubuntu](http://wiki.ros.org/noetic/Installation/Ubuntu)
(you need to install `ros-noetic-desktop-full`)

This option is not recommended.

Really available only for Linux machines. Warning - it may influence your
machine behaviour, so do that if you know what you do or you are on virtual
machine.

## Gratitude and reference

Initial materials provided by [Oleg Shipitko](https://www.oleg-shipitko.com/).\
Currently course is thaught by Vladislav Goncharenko
