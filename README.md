
4-Bit Carry Look-Ahead Adder (CLA) Using Verilog HDL
📌 Project Overview

This project implements a 4-bit Carry Look-Ahead Adder (CLA) using Verilog HDL.

A Carry Look-Ahead Adder is a fast adder circuit that reduces carry propagation delay by generating carry signals in parallel instead of waiting for each carry to propagate through successive full adders.

The design performs 4-bit binary addition with an input carry (Cin) and produces a 4-bit sum (S) and a final carry output (Cout).

🎯 Objectives
To design a 4-bit Carry Look-Ahead Adder using Verilog HDL.
To understand Generate and Propagate signals.
To implement parallel carry-generation logic.
To verify the design using a Verilog testbench.
To analyze the simulation waveform using Synopsys Verdi.
⚙️ Design Specifications
Parameter	Description
Design	4-bit Carry Look-Ahead Adder
Language	Verilog HDL
Inputs	A[3:0], B[3:0], Cin
Outputs	S[3:0], Cout
Architecture	Carry Look-Ahead
Simulation Tool	Synopsys Verdi
🧠 Working Principle

The Carry Look-Ahead Adder uses two important signals:

1. Generate (G)

A carry is generated when both input bits are 1.

G[i] = A[i] & B[i]

2. Propagate (P)

A carry is propagated when the XOR of the two input bits is 1.

P[i] = A[i] ^ B[i]

Carry Generation Equations

The carry signals are calculated using parallel Boolean expressions.

C1 = G0 + P0·Cin
C2 = G1 + P1·G0 + P1·P0·Cin
C3 = G2 + P2·G1 + P2·P1·G0 + P2·P1·P0·Cin
C4 = G3 + P3·G2 + P3·P2·G1 + P3·P2·P1·G0 + P3·P2·P1·P0·Cin
Sum Equations
S0 = P0 XOR Cin
S1 = P1 XOR C1
S2 = P2 XOR C2
S3 = P3 XOR C3

The final carry output is:

Cout = C4

📂 Project Structure
text
4-bit-Carry-Look-Ahead-Adder/
│
├── cla.v               # Verilog design code
├── cla_tb.v            # Verilog testbench
├── cla.vcd             # Simulation waveform file
├── 4bitclaoutput.png   # Simulation waveform screenshot
└── README.md           # Project documentation

🧪 Test Cases

The design is verified using seven different test cases.

Test Case	A	B	Cin	Expected Sum	Cout
1	8	4	0	12	0
2	5	3	1	9	0
3	3	5	0	8	0
4	15	1	0	0	1
5	15	15	1	15	1
6	0	0	0	0	0
7	9	7	1	1	1
Test Case Explanation
Normal Addition: Tests addition of two numbers without an input carry.
Carry Input: Tests addition with Cin = 1.
Basic Addition: Verifies another normal addition combination.
Overflow: Checks carry generation when the result exceeds 4 bits.
Maximum Addition: Tests maximum input values with carry input.
Zero Addition: Verifies addition of two zero values.
Carry Generation: Checks carry generation with a carry input.
💻 Simulation

The design was simulated using Synopsys Verdi.

Steps to Run
Write the design code in cla.v.
Write the testbench code in cla_tb.v.
Compile and simulate both Verilog files.
Generate the waveform using $dumpfile and $dumpvars, or use the waveform database supported by your simulator.
Open the simulation waveform in Verdi.
Observe the input and output signals.
Simulation Commands (Icarus Verilog)
bash
iverilog -o cla_sim cla.v cla_tb.v
vvp cla_sim
gtkwave cla.vcd

📊 Simulation Results

The waveform verifies the following signals:

a[3:0] – First 4-bit input.
b[3:0] – Second 4-bit input.
c0 – Input carry.
S[3:0] – Sum output.
Cout – Final carry output.

All seven test cases produce the expected sum and carry values.

Waveform Output

!4-bit Carry Look-Ahead Adder Simulation

✅ Advantages of Carry Look-Ahead Adder
Reduces carry propagation delay.
Faster than a conventional Ripple Carry Adder for comparable bit widths.
Generates carry signals using parallel logic.
Suitable for high-speed arithmetic circuits.
📚 Applications
Arithmetic Logic Units (ALUs).
Digital Signal Processing (DSP).
Microprocessors.
High-speed arithmetic circuits.
Computer architecture.
🏁 Conclusion

The 4-bit Carry Look-Ahead Adder was successfully designed and simulated using Verilog HDL. The design uses Generate and Propagate signals to calculate carry outputs in parallel, reducing carry propagation delay compared with a Ripple Carry Adder.

The simulation results match the expected outputs for all seven test cases, verifying the correct functionality of the design.

Tools Used: Verilog HDL | Synopsys Verdi | Linux

Project Type: Digital Electronics / VLSI Design
