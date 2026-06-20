# PipeBot — Gait-Controlled Pneumatic Crawler for Pipe Inspection

MSc Dissertation Project | COMP702 | University of Liverpool (2024/25)
Supervised by Dr. Mario Gianni

---

## Demo

[![PipeBot Crawler Demo](https://img.youtube.com/vi/j6D__1KxbAg/0.jpg)](https://youtu.be/j6D__1KxbAg)

---

## Overview

Industrial pipelines in refineries, chemical plants, and utility infrastructure are hazardous to inspect manually due to confined spaces, toxic gases, and complex geometries. This project investigates a simulation-based approach to confined-space inspection using a gait-controlled pneumatic crawler robot.

The crawler was designed around a **wall-press locomotion mechanism** — four prismatic actuators press outward against pipe walls to generate traction, mimicking bio-inspired locomotion strategies found in inchworm and soft-body robots. A custom **four-phase gait cycle** was implemented and tested in CoppeliaSim across two validation environments: mid-air (sequencing validation) and between parallel walls (environmental interaction).

---

## Robot Design

- **Body structure:** Central base with four prismatic actuators arranged in parallel pairs on either side
- **Locomotion mechanism:** Wall-press contact — actuators extend outward to grip pipe walls, alternating diagonal pairs to produce forward thrust
- **Joints:** Prismatic joints (piston extension/retraction) + revolute joints (yaw and roll adjustment)
- **Target pipe diameter:** 100 mm internal diameter
- **Steering:** Yaw joint for reorientation inside the pipe

---

## Four-Phase Gait Cycle

The crawler's locomotion is governed by a custom four-phase gait cycle:

| Phase | Action |
|---|---|
| Phase 1 | Front-left and rear-right actuators extend simultaneously — diagonal anchor |
| Phase 2 | Front actuator retracts while rear maintains contact — front segment slides forward |
| Phase 3 | Front re-extends, rear retracts — rear body pulled forward |
| Phase 4 | All actuators reset — cycle repeats |

---

## Implementation

**Simulation platform:** CoppeliaSim (EDU)

**Control scripting:** Lua (non-threaded child scripts, 20 Hz control loop)

**Two Lua controllers were developed:**

1. **Mid-Air Gait Script** — validates four-phase timing and joint sign conventions in a gravity-free environment before wall interaction. Uses sinusoidal profiles for hip revolute joints and range-aware prismatic drive for pistons.

2. **Between-Walls Crawler Script** — executes the full gait under confinement. Implements a finite-state machine (FSM) with low-pass filtering on slide, foot, and yaw commands. Auto-discovers joints by range and ancestry. Achieves stable wall-press contact with alternating diagonal anchoring.

**3D model:** Imported from .stl mesh provided by supervisor; simplified by ~45% (complex surfaces replaced with primitive shapes) to achieve 8–10 fps on AMD Ryzen 5000 / 16 GB RAM.

---

## Results

| Test Scenario | Avg Timing Error | Max Timing Error | FPS | Success Rate |
|---|---|---|---|---|
| Mid-Air Gait Cycle (Stage 1) | ±0.3 s | 0.7 s | 15 fps | 90% |
| Wall-Press Cycle (Stage 2) | ±0.4 s | 0.8 s | 12 fps | 70% |

**Wall-press contact forces:** 8–14 N (stable attachment achieved)

**Forward displacement:** 0 mm achieved — actuators generated predominantly radial rather than axial forces. Theoretical analysis showed that at 10–15° piston offset, only ~20% of stroke translates to axial thrust (~1.0–1.2 mm per cycle, below the 2–5 mm target).

**Key finding:** Stable gait cycle and wall-press contact were successfully demonstrated. Continuous forward locomotion was not achieved due to force alignment limitations, identifying a clear direction for future hardware design.

---

## Tech Stack

| Component | Technology |
|---|---|
| Simulation Engine | CoppeliaSim (V-REP EDU) |
| Control Scripting | Lua |
| 3D Modelling | STL mesh simplification with CoppeliaSim primitives |
| Gait Control | Four-phase FSM, sinusoidal actuation profiles |
| Domain | Industrial robotics, confined-space inspection, bio-inspired locomotion |

---

## Repository Structure

```
Pipe-Inspection-Simulation/
├── simulation/
│   ├── scenes/          # CoppeliaSim .ttt scene files
│   └── scripts/         # Lua control scripts (mid-air + between-walls)
├── docs/
│   ├── figures/         # Timing diagrams, gait cycle snapshots
│   └── report_notes.md  # Design rationale and results
├── results/             # Simulation screenshots, logs
└── README.md
```

---

## Key Limitations & Future Work

- Actuator forces were predominantly radial — future designs should angle pistons to convert wall-press force into axial thrust
- Open-loop gait control — closed-loop feedback (IMU, force sensors) would reduce phase drift
- Pneumatic pistons approximated with prismatic joints — compliant actuator modelling needed for higher realism
- 90° bend navigation proposed but not implemented — preliminary analysis confirms feasibility

---

## Academic Context

- **Module:** COMP702 — MSc Project (2024/25)
- **Institution:** University of Liverpool, Department of Computer Science
- **Supervisor:** Dr. Mario Gianni
- **Keywords:** crawler bot simulation, pipe inspection, gait cycle, CoppeliaSim, locomotion control, confined space inspection, wall-press mechanism, bio-inspired robotics

---

## Author

**Akheel R Gogeri**
MSc Artificial Intelligence with Data Science — University of Liverpool
[LinkedIn](https://linkedin.com/in/akheel-gogeri) | [GitHub](https://github.com/AkheelGogeri)

