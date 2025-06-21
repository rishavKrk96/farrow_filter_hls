# FPGA-Based Farrow Filter for Fractional Delay Resampling 

## Project Overview

This project implements a fractional delay FIR filter using the Farrow structure, designed for resampling applications. The design was synthesized and tested on the Intel Arria II GX FPGA using Quartus Prime. The Farrow structure enables efficient cubic interpolation by organizing a bank of FIR filters with polynomial coefficients, allowing real-time signal reconstruction with fractional time shifts. These filters are commonly used in systems requiring precise timing alignment, such as digital modems.

## Design and Optimization

Starting from a canonical Farrow filter Simulink model, several modifications were introduced to enhance performance. The original implementation had a critical path consisting of 4 multipliers and 6 adders, with a maximum operating frequency of 28 MHz.

Key improvements made:

- Converted the FIR filter structure from canonical to transposed form.
- Added pipeline registers after each FIR filter stage to enable deeper pipelining.
- Inserted additional pipeline stages during the linear combination of FIR outputs, introducing a total latency of 4 extra cycles.
- Retained DSP-based multipliers, as replacing them with LUT-based shift-and-add logic was only partially feasible due to the nature of the coefficients.

Input and fractional delay values were represented as 16-bit signed fixed-point numbers with 14 fractional bits. After optimization, the design achieved a maximum frequency of 101.56 MHz under the 900 mV slow corner at 100°C.

## Simulation and Results

The design was validated using ModelSim simulations with sinusoidal input and ramped fractional delay. The system performed accurate interpolation under varying delay conditions.

### FPGA Resource Utilization (Arria II GX)

- Maximum frequency: 101.56 MHz (baseline was 28 MHz)
- Combinational ALUTs: 603
- Dedicated Logic Registers: 410
- DSP 18-bit Blocks: 12
- Block Memory Bits: 152
- I/O Pins: 48

### Timing Summary (Slow 900mV 100°C Corner)

- Setup Slack: -4.846
- Hold Slack: 0.140
- Recovery Slack: 3.508
- Removal Slack: -0.112
- Min Pulse Width Slack: 1.154

## Conclusion

This assignment successfully demonstrates the implementation and optimization of a fractional delay FIR filter using the Farrow structure on FPGA. By restructuring the filter into a transposed form and introducing pipelining, the design achieved a significant speedup—more than 3x over the baseline. Though DSPs were still used for multiplication, the design showed that further gains could be made through alternative coefficient strategies or shift-based logic. The final implementation is resource-efficient and meets the desired performance targets on the Arria II GX platform.

## Author

Rishav Karki  

