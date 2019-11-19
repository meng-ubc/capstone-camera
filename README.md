# capstone-camera
This repository contains a work-in-progress verilog mipi core and python scripts raspberry pi camera

## MIPI core
This is a quartus ii project written in system verilog.
Used to gather footage from camera and display it onto a screen through VGA port.

The main parts of this project is a camera interface and a graphics controller.

The graphics controller was adapted from CPEN391 course materials from UBC.

## Python scripts
The python_script folder contains python scripts for streaming video on raspberry pi to a webpage on another device which connects to the same router.