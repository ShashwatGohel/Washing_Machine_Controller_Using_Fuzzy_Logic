# Washing_Machine_Controller_Using_Fuzzy_Logic
# Full Washing Machine Controller System (WashMaster 3000)

The **Full Washing Machine Controller System** is a Verilog-based design that simulates the functioning of an advanced washing machine. It includes features for load size detection, water level categorization, detergent level measurement, and dynamic wash cycle control using a state machine. This project provides an efficient and modular solution suitable for simulation and learning purposes in digital design and embedded systems.

## Features

- **Load Size Detection**: Categorizes the laundry load into small, medium, or large.
- **Water Level Categorization**: Detects water levels as low, medium, or high.
- **Detergent Level Categorization**: Measures detergent levels as light, medium, or heavy.
- **Wash Mode Selection**: Dynamically selects the wash mode (Gentle, Normal, Heavy) based on inputs.
- **State Machine-Controlled Wash Cycle**: Automates the process through states: Wash, Rinse, Spin, and Drain.
- **Reset Mechanism**: Returns the system to its initial state upon reset.

## Prerequisites

### Software Requirements

- **Verilog Simulator**: Use tools like Icarus Verilog, ModelSim, or Xilinx Vivado.
- **Waveform Viewer**: Recommended for analyzing outputs (e.g., GTKWave).

### Hardware Requirements (Optional, if implemented on FPGA)

- FPGA Board (e.g., Xilinx or Intel Altera boards)
- LEDs for state visualization
- Switches for input simulation
- Clock generator module

## Getting Started

### Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/ShashwatGohel/Washing_Machine_Controller.git
   cd Washing_Machine_Controller
