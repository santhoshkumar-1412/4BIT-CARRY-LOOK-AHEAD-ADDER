
# ⚡ 4-Bit Carry Look-Ahead Adder (CLA) Using Verilog HDL

<p align="center">
  <b>RTL Design | Digital Logic Design | Functional Verification</b>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Language-Verilog-blue?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Simulation-Synopsys%20VCS-orange?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Debugging-Synopsys%20Verdi-green?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Waveform-VCD-purple?style=for-the-badge" />
</p>

## 1. Project Overview

This project implements a **4-bit Carry Look-Ahead Adder (CLA)** using Verilog Hardware Description Language (HDL).

A Carry Look-Ahead Adder is a high-speed digital adder that reduces carry propagation delay by calculating carry signals in parallel using Generate (G) and Propagate (P) logic.

Unlike a conventional Ripple Carry Adder, the CLA generates carry signals in advance, improving arithmetic addition speed.

The design accepts two 4-bit unsigned binary operands and a 1-bit carry input (Cin), producing a 4-bit sum and a 1-bit carry output (Cout).

The design is simulated using Synopsys VCS, and waveform analysis is performed using Synopsys Verdi.

## 2. Design Specifications

| Parameter | Description |
|---|---|
| Design Name | 4-Bit Carry Look-Ahead Adder |
| Design Type | Combinational Logic |
| Architecture | Carry Look-Ahead |
| Input Operand A | 4-bit |
| Input Operand B | 4-bit |
| Carry Input | 1-bit |
| Sum Output | 4-bit |
| Carry Output | 1-bit |
| Basic Signals | Generate and Propagate |
| HDL | Verilog |
| Simulator | Synopsys VCS |
| Waveform Viewer | Synopsys Verdi |
| Waveform Format | VCD |

## 3. Design Methodology

The Carry Look-Ahead Adder uses Generate and Propagate signals to calculate carry outputs without waiting for sequential carry propagation.

### 3.1 Generate Signal (G)

A carry is generated when both input bits are HIGH.

**Boolean Expression:**

`G[i] = A[i] & B[i]`

### 3.2 Propagate Signal (P)

A carry is propagated when the XOR of the two input bits is HIGH.

**Boolean Expression:**

`P[i] = A[i] ^ B[i]`

### 3.3 Carry Generation Equations

The carry signals are calculated using the following look-ahead equations.

```text
C1 = G0 + P0.Cin

C2 = G1 + P1.G0 + P1.P0.Cin

C3 = G2 + P2.G1 + P2.P1.G0
     + P2.P1.P0.Cin

C4 = G3 + P3.G2 + P3.P2.G1
     + P3.P2.P1.G0
     + P3.P2.P1.P0.Cin
```

Where:
- `G` represents the Generate signal.
- `P` represents the Propagate signal.
- `Cin` represents the input carry.
- `C1, C2, C3, C4` represent intermediate carry signals.

### 3.4 Sum Generation

The sum outputs are calculated using XOR operations between the propagate signals and corresponding carry inputs.

**Boolean Expressions:**

```text
S0 = P0 XOR Cin
S1 = P1 XOR C1
S2 = P2 XOR C2
S3 = P3 XOR C3

Cout = C4
```

### 3.5 Final Addition

The overall arithmetic operation is:

`Result = A + B + Cin`

The maximum possible addition is:

`15 + 15 + 1 = 31`

Therefore, a 4-bit sum and a 1-bit carry output are sufficient to represent the result.

## 4. RTL Module Architecture

The project consists of the following Verilog modules:

| Module | Functionality |
|---|---|
| `cla` | Implements 4-bit Carry Look-Ahead Adder logic |
| `cla_tb` | Applies test vectors and verifies the CLA functionality |

### Module Interface

| Signal | Direction | Width | Description |
|---|---|---|---|
| `a` | Input | 4-bit | First operand |
| `b` | Input | 4-bit | Second operand |
| `c0` | Input | 1-bit | Carry input |
| `S` | Output | 4-bit | Sum output |
| `Cout` | Output | 1-bit | Final carry output |

## 5. Repository Structure

```text
4-Bit-Carry-Look-Ahead-Adder/
│
├── cla.v
│   └── RTL source code
│
├── cla_tb.v
│   └── Functional verification testbench
│
├── waveform.png
│   └── Simulation waveform screenshot
│
├── README.md
│
└── .gitignore
```

Generated simulation files and compiled executables can be maintained locally rather than committed to GitHub.

## 6. Functional Verification

A Verilog testbench is developed to verify the functional behavior of the 4-bit Carry Look-Ahead Adder.

The testbench applies seven different input combinations and observes the corresponding sum and carry outputs.

### 6.1 Test Scenarios

| Test Case | A | B | Cin | Expected Sum | Cout |
|:---:|---:|---:|---:|---:|---:|
| TC1 | 8 | 4 | 0 | 12 | 0 |
| TC2 | 5 | 3 | 1 | 9 | 0 |
| TC3 | 3 | 5 | 0 | 8 | 0 |
| TC4 | 15 | 1 | 0 | 0 | 1 |
| TC5 | 15 | 15 | 1 | 15 | 1 |
| TC6 | 0 | 0 | 0 | 0 | 0 |
| TC7 | 9 | 7 | 1 | 1 | 1 |

### 6.2 Test Case Explanation

1. **Normal Addition:** Verifies addition without an input carry.
2. **Carry Input:** Checks addition with Cin = 1.
3. **Basic Addition:** Tests another normal addition combination.
4. **Overflow:** Verifies carry generation when the result exceeds 4 bits.
5. **Maximum Addition:** Tests maximum operand values with carry input.
6. **Zero Addition:** Verifies the addition of two zero values.
7. **Carry Generation:** Checks carry generation with an input carry.

### 6.3 Expected Simulation Output

```text
A=8  B=4  Cin=0  Sum=12  Cout=0
A=5  B=3  Cin=1  Sum=9   Cout=0
A=3  B=5  Cin=0  Sum=8   Cout=0
A=15 B=1  Cin=0  Sum=0   Cout=1
A=15 B=15 Cin=1  Sum=15  Cout=1
A=0  B=0  Cin=0  Sum=0   Cout=0
A=9  B=7  Cin=1  Sum=1   Cout=1
```

## 7. Simulation Environment

The design is simulated using Synopsys VCS, and waveform visualization is performed using Synopsys Verdi.

### 7.1 Simulation Workflow

```text
       Verilog RTL Design
               |
               v
        Verilog Testbench
               |
               v
         Synopsys VCS
               |
               v
         RTL Simulation
               |
               v
         VCD Waveform
               |
               v
        Synopsys Verdi
               |
               v
        Waveform Analysis
```

### 7.2 VCS Compilation

Compile the RTL source and testbench using:

```bash
vcs -full64 -kdb -debug_access+all cla.v cla_tb.v -o simv
```

### 7.3 Execute Simulation

```bash
./simv
```

The simulation executes the testbench and generates the simulation results.

### 7.4 VCD Waveform Generation

Add the following commands inside the testbench:

```verilog
initial begin
    $dumpfile("cla.vcd");
    $dumpvars(0, cla_tb);
end
```

These commands generate a VCD waveform database containing the simulation signals.

### 7.5 Open Waveform in Synopsys Verdi

```bash
verdi -ssf cla.vcd &
```

The generated waveform can be inspected using the Verdi waveform viewer.

## 8. Waveform Analysis

Synopsys Verdi is used to inspect and analyze the simulation waveforms.

The following signals are observed:

| Signal | Width | Description |
|---|---:|---|
| `a[3:0]` | 4 bits | First input operand |
| `b[3:0]` | 4 bits | Second input operand |
| `c0` | 1 bit | Input carry |
| `S[3:0]` | 4 bits | Sum output |
| `Cout` | 1 bit | Final carry output |

Waveform analysis helps to:

- Inspect input and output signal transitions.
- Verify Generate and Propagate logic.
- Observe parallel carry generation.
- Verify sum and carry outputs.
- Debug combinational circuit behavior.

### Simulation Waveform

![4-Bit CLA Simulation Waveform](waveform.png)

## 9. Tools and Technologies

| Tool / Technology | Purpose |
|---|---|
| Verilog HDL | RTL design implementation |
| Synopsys VCS | RTL compilation and simulation |
| Synopsys Verdi | Waveform visualization and debugging |
| VCD | Simulation waveform database |
| Linux | Development environment |
| Git | Version control |
| GitHub | Source code management and documentation |

## 10. Key Learning Outcomes

Through this project, the following concepts are explored:

- Combinational digital circuit design.
- Carry Look-Ahead Adder architecture.
- Generate and Propagate signals.
- Parallel carry generation.
- Boolean algebra and carry equations.
- Verilog RTL modeling.
- Testbench development and functional verification.
- RTL simulation using Synopsys VCS.
- Waveform analysis using Synopsys Verdi.

## 11. Advantages

- Reduces carry propagation delay.
- Generates carry signals using parallel logic.
- Provides faster addition compared with a conventional Ripple Carry Adder for comparable implementations.
- Suitable for high-speed arithmetic circuits.

## 12. Applications

- Arithmetic Logic Units (ALUs).
- Microprocessors.
- Digital Signal Processing.
- High-speed arithmetic circuits.
- Computer Architecture.
- VLSI Design.

## 13. Future Enhancements

Potential extensions to this project include:

- Extending the CLA architecture to 8-bit and 16-bit designs.
- Comparing CLA and Ripple Carry Adder architectures.
- Implementing hierarchical Carry Look-Ahead logic.
- Performing RTL synthesis and area analysis.
- Evaluating propagation delay and critical paths.
- Performing gate-level simulation and timing verification.

## 14. Conclusion

The 4-bit Carry Look-Ahead Adder was designed using Verilog HDL and functionally verified through simulation.

The design uses Generate and Propagate signals to calculate carry outputs in parallel, reducing carry propagation delay compared with a conventional Ripple Carry Adder.

The seven test cases cover normal addition, carry input, zero addition, and overflow conditions.

The simulation results demonstrate the expected functionality of the design.

---

## 15. Author

**SANTHOSH KUMAR N A**

RTL Design | Digital Design | VLSI Engineering

- GitHub: [Your GitHub Profile](https://github.com/your-username)
- LinkedIn: [Your LinkedIn Profile](https://linkedin.com/in/your-profile)

## 16. License

This project is intended for educational and learning purposes.

You are welcome to explore, modify, and extend the implementation with appropriate attribution.

---

<p align="center">
  <b>Designed with Verilog HDL | Simulated with Synopsys VCS | Debugged with Synopsys Verdi</b>
</p>

<p align="center">
  ⭐ If you find this project useful, consider starring the repository!
</p>

---

## GitHub Topics

verilog · verilog-hdl · carry-look-ahead-adder · cla · vlsi · rtl-design · digital-design · digital-electronics · synopsys-vcs · synopsys-verdi · functional-verification · combinational-logic · hardware-design
