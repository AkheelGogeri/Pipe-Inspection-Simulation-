Pipe Inspection Simulation — Wall-Press Crawler Robot

## Demo

[![PipeBot Crawler Demo](https://img.youtube.com/vi/YOUR_VIDEO_ID/0.jpg)](https://www.youtube.com/watch?v=YOUR_VIDEO_ID)



A simulation-only project of an autonomous wall-press crawler robot designed for industrial pipe inspection. Built in CoppeliaSim (formerly V-REP) using Lua scripting, the robot uses a wall-pressing locomotion mechanism to navigate inside pipes without falling, mimicking real-world inspection hardware used in oil, gas, and infrastructure industries.


Overview

Industrial pipe inspection is a high-risk, time-consuming task typically requiring manual intervention or expensive specialist equipment. This project simulates a crawler robot that can autonomously traverse the interior of a pipe by pressing against the pipe walls for traction and stability — a common mechanism in real inspection robots.


Features


Wall-press locomotion mechanism simulated in CoppeliaSim
Lua scripting for gait control and motion sequencing
Timing diagrams for synchronised leg/wheel actuation
Scene hierarchy structured for modular component control
Stable traversal through straight pipe sections without slipping or falling



Tech Stack

ComponentTechnologySimulation EngineCoppeliaSim (V-REP)ScriptingLuaRobot MechanismWall-press crawlerDomainIndustrial robotics, pipe inspection


How It Works


The robot body is designed to press outward against the pipe walls using spring-loaded or actuated arms
Lua scripts control the timing and sequence of actuation to produce forward locomotion
CoppeliaSim physics engine simulates friction, contact forces, and weight distribution
Gait timing is tuned to maintain stable wall contact throughout traversal



Project Structure

Pipe-Inspection-Simulation/
├── scene/          # CoppeliaSim scene files (.ttt)
├── scripts/        # Lua control scripts
└── docs/           # Timing diagrams and design notes


Use Case & Relevance

Wall-press crawlers are used in:


Oil and gas pipeline inspection
Water and sewage infrastructure maintenance
Nuclear facility pipe monitoring
Any environment where human access is hazardous or impossible


This simulation demonstrates the core locomotion principles applicable to real-world deployment.


Author

Akheel R Gogeri
B.E. Automation & Robotics — KLE Technological University
MSc Artificial Intelligence with Data Science — University of Liverpool
