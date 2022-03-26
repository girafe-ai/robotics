# Homework 5

In this homework assignment you are going to implement an algorithm for 
trajectory calculation for a self-driving car in a parking lot.

**Note:** Python 3.6 and higher with TKinter is required. Install sympy

`pip install sympy`

for computing collisions.

## Task editor

The homework directory contains a single file `task1_tkinter_sympy.py`
which contains TKinter code for designing planning tasks to test your planner. 

Purple rectangle is the initial position of your car. Green rectangle is
the target position. Black rectangles (created by clicking on NEW button)
are obstacles that should be avoided. All rectangles can be moved by 
means of left mouse button and rotated by means of right mouse button.
It is assumed that rectangles don't intersect (strange things happen
if you drag-and-drop one onto another, try to avoid it).

All rectangles have orientation or 'yaw', even if it is not displayed.
Green and purple rectangles are initialy directed towards the top of the screen
(yaw = 0), but after rotation the yaw is the angle between -Pi and Pi indicating
where the car heads.

## Trajectory construction

The Go button should run execute your algorithm for constructing a path connecting
purple rectangle to green rectangle. The path should respect their orientation,
avoid obstacles and be reasonably short and smooth. 
A path is a sequence of points (positions), it should be
drawn on the canvas at the end of the GO callback. You can put your code in
the same file. You may use any of the algorithms we discussed in lectures.

## Assessment

You submit a single file containing both planning task editor and your implementation.
I am going to give it a few test using the editor and provide feedback.

To receive the highest mark, you work should be in some way special, that is different to
other students' works. Here is a list of optional features you may want to implement
to make your work special:

- allow your car to move backward as well as forward
- find a way to visualise your search tree and/or frontier
- use a clever heuristic function
- find a way to make your search significantly faster than brute-force A*








 



