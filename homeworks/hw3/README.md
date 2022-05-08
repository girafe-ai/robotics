# Homework 3

In this homework assignment, we will implement a PID controller to control the
steering wheel of an autonomous vehicle. We will test the implemented regulator
on a simulator of an autonomous car, designed for Udacity Self-Driving Car
Nanodegree https://github.com/udacity/self-driving-car-sim.

We will use a prepared docker container for homework (of course you can install
everything into your local OS or use virtual machine if you prefer to). In the
directory where the archive is unpacked, build the docker image:

`docker build --tag homework`

After building the image, you can start the container with the command:

`sudo docker run -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -it homework`

**Warning:** If you get an error, starting graphical applications from the
container, run the following command on you host OS: xhost + local

To run an additional terminal in a container, you can find out the
`CONTAINER_ID` by running the `docker ps` command and finding the required
container in the `CONTAINER_ID` output. After that, you need to run the command:

`docker exec -it <CONTAINER ID> zsh`

**Warning:** With this method of launching an additional terminal, the launch of
graphical applications will not be available from it.

In the container, you need to go to the homework/homework3/ directory:

`cd homework/homework3/`

The homework directory contains three folders:

- cpp - directory containing files to implement PID regulator in C++
- cpp - directory containing files to implement PID regulator in Python
- term2_sim_linux/ - directory with a simulator of an autonomous vehicle

To run the simulator, run the executable file:

`/homework/homework3/term2_sim_linux/term2_sim.x86_64`

Select the "Project 4: PID Controller" tab and press Select.

There are two programming languages which can be used for this assignment (С++
or Python). Depending on the language you prefer proceed to the corresponding
section.

## Python

**Note:** Python 3.6 and higher is required

`cd /homework/homework3/python`

The homework directory contains two files:

- `control.py` - main file for realizing steering control;
- `pid.py` - realization of PID regulator.

Realize the PID regulator in order to control the steering of autonomous car.
All the instructions are given inside `.py` files. Note that you should launch
control.py script in another terminal (not the one you used to launch
simulator).

`code <source directory> --user-data-dir = / vscode`

## С++

In another terminal (not the one you used to launch simulator) of the container,
you need to run a car control program with an implemented PID controller. To do
this, go to the source code folder:

`cd /homework/homework3/cpp/CarND-PID-Control-Project`

Create a build directory and build the project:

```bash
mkdir build && cd build
cmake .. && make
```

Start the regulator (**Warning** when starting the regulator, the simulator must
be running):

`./pid`

After starting the regulator, the vehicle should drive in a straight line. This
is because the regulator code for steering control has not yet been implemented.
You need to implement a PID controller in C ++. To do this, go to the directory:

`cd /homework/homework3/cpp/CarND-PID-Control-Project/src`

In this directory, you need to modify 2 files:

- `PID.cpp` - PID regulator implementation
- `main.cpp` - the main file with the main function, which implements the
  connection to the simulator and the call of the PID regulator

In PID.cpp, you need to implement 3 functions:

- void PID :: Init (double Kp*, double Ki*, double Kd\_) - initialization of the
  regulator, as well as its internal state
- void PID :: UpdateError (double cte) - a function that updates the internal
  state of the regulator (proportional, integral and differential), depending on
  the error of the vehicle's lateral displacement from the desired trajectory
  (cross-track error, cte)
- double PID :: TotalError () - calculation of the resulting influence of the
  regulator (according to the formula of the PID regulator from the lecture),
  which will be fed to the steering, as the angle of steering wheel rotation

In `main.cpp`, you need to modify the main function, in which you need to add
the initialization of the PID controller, as well as its use to calculate the
steer_value - control signal for the angle of rotation of the wheels depending
on the current error of the lateral displacement from the trajectory
(cross-track error, cte).

After making the necessary modifications, rebuild the cmake .. && make project
from the /homework/homework3/cpp/CarND-PID-Control-Project/build folder. Run the
simulator and regulator to see the updated car controls. Select such
coefficients of the PID controller (Kp, Ki, Kd) at which the deviation from the
trajectory will be minimal.

**Warning!** For the convenience of programming, the Visual Studio Code
development environment is installed in the container. Launching Visual Studio
Code only works from a terminal that allows graphical applications to run. The
Visual Studio Code environment can be launched with the command:

`code <source directory> --user-data-dir = / vscode`
