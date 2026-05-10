# FUZZY INVERSE KINEMATICS OF ROBOTIC ARM

## Overview

This project models the **Inverse Kinematics (IK)** of a 2-Link Robotic Arm using **Fuzzy Logic** in MATLAB.

Instead of solving complex trigonometric inverse kinematics equations, the system uses a **Sugeno Fuzzy Inference System (FIS)** to intelligently predict robotic joint angles from target X-Y coordinates.

The project demonstrates how fuzzy logic can simplify robotic motion control while improving smoothness, adaptability, and real-time performance.

---

# Features

- Fuzzy Logic Based Inverse Kinematics
- 2-Link Robotic Arm Modeling
- Real-Time Joint Angle Prediction
- Gaussian Membership Functions
- Workspace-Based Intelligent Rule System
- Smooth Motion Estimation
- Noise-Tolerant Position Handling
- Robotic Arm Visualization
- Surface Viewer and Rule Viewer
- MATLAB Fuzzy Logic Toolbox Implementation

---

# Inputs and Outputs

## Inputs

| Input | Description |
|---|---|
| X Position | End-effector X coordinate |
| Y Position | End-effector Y coordinate |

---

## Outputs

| Output | Description |
|---|---|
| Theta1 | Shoulder joint angle |
| Theta2 | Elbow joint angle |

---

# Novelty Added

Compared to the standard MATLAB fuzzy robotic arm example, the following enhancements are added:

- Adaptive workspace modeling
- Smooth fuzzy interpolation
- Real-time inverse kinematics approximation
- Noise-tolerant angle estimation
- Intelligent multi-region fuzzy rule base
- Improved robotic motion smoothness
- Better nonlinear workspace handling

---

# Technologies Used

- MATLAB
- Fuzzy Logic Toolbox
- Sugeno Fuzzy Inference System
- Robotics Concepts
- Gaussian Membership Functions

---

# Membership Functions

## Input Membership Functions

### X Position
- Left
- Center
- Right

### Y Position
- Bottom
- Middle
- Top

---

## Output Membership Functions

### Theta1
- Low
- Medium
- High

### Theta2
- Small
- Medium
- Large

---

# Fuzzy Rule Base

The fuzzy inference system uses intelligent rules such as:

```matlab
IF X is Left AND Y is Bottom
THEN Theta1 is Low AND Theta2 is Small
```

```matlab
IF X is Right AND Y is Top
THEN Theta1 is High AND Theta2 is Large
```

These rules help the robotic arm estimate suitable joint angles for reaching target positions.

---

# Robotic Arm Visualization

The project includes:

- Forward kinematics visualization
- End-effector tracking
- Link plotting
- Workspace surface plots
- Rule viewer visualization

---

# Example Output

```matlab
Target X Position : 7
Target Y Position : 6

Predicted Joint Angles:

Theta1 = 150°
Theta2 = 135°
```

---

# Advantages of Fuzzy Inverse Kinematics

| Traditional IK | Fuzzy IK |
|---|---|
| Complex equations | Approximate reasoning |
| High computation | Faster execution |
| Sensitive to noise | Noise tolerant |
| Hard nonlinear handling | Better adaptability |
| Singularities possible | Smooth interpolation |

---

# Applications

- Industrial Robotics
- Pick-and-Place Systems
- Medical Robotics
- Autonomous Manipulators
- AI-Based Motion Control
- Humanoid Robots
- Smart Automation Systems

---

# MATLAB Requirements

- MATLAB R2021a or later
- Fuzzy Logic Toolbox

---

# How to Run

1. Open MATLAB
2. Run the main `.m` file
3. View:
   - Membership Functions
   - Surface Viewer
   - Rule Viewer
   - Robotic Arm Simulation

---

# Future Improvements

- 3-Link Robotic Arm Extension
- Deep Learning + Fuzzy Hybrid IK
- Real-Time Hardware Integration
- 3D Robotic Arm Modeling
- Obstacle Avoidance System
- Reinforcement Learning Integration

---

# Project Structure

```text
├── fuzzy_robot_arm.m
├── README.md
```

---

# Conclusion

This project demonstrates an intelligent fuzzy-logic-based approach for solving robotic arm inverse kinematics problems efficiently. The system reduces mathematical complexity while improving smoothness, adaptability, and robustness for modern robotic control applications.
