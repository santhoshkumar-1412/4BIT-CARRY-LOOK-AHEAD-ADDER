
# ⚡ 4-Bit Carry Look-Ahead Adder (CLA) Using Verilog HDL

## 📌 Project Overview

This project implements a **4-bit Carry Look-Ahead Adder (CLA)** using Verilog HDL.

A Carry Look-Ahead Adder is a high-speed adder that reduces carry propagation delay by generating carry signals in parallel instead of waiting for each carry to propagate through successive stages.

## 🎯 Objectives

- 💡 Design a 4-bit Carry Look-Ahead Adder using Verilog HDL.
- 📖 Understand Generate and Propagate signals.
- ⚙️ Implement parallel carry generation logic.
- 🧪 Verify the design using a Verilog testbench.
- 📊 Analyze simulation waveforms using Synopsys Verdi.

## ⚙️ Design Specifications

| Parameter | Description |
|---|---|
| 🔧 Design | 4-bit Carry Look-Ahead Adder |
| 💻 Language | Verilog HDL |
| 📥 Inputs | A[3:0], B[3:0], Cin |
| 📤 Outputs | S[3:0], Cout |
| 🏗️ Architecture | Carry Look-Ahead |
| 🖥️ Simulation Tool | Synopsys Verdi |

## 🧠 Working Principle

The Carry Look-Ahead Adder uses two important signals.

### 1️⃣ Generate Signal (G)

A carry is generated when both input bits are 1.

G[i] = A[i] & B[i]

### 2️⃣ Propagate Signal (P)

A carry is propagated when the XOR of the two input bits is 1.

P[i] = A[i] ^ B[i]

### 3️⃣ Carry Generation Equations

```text
C1 = G0 + P0.Cin

C2 = G1 + P1.G0 + P1.P0.Cin

C3 = G2 + P2.G1 + P2.P1.G0
     + P2.P1.P0.Cin

C4 = G3 + P3.G2 + P3.P2.G1
     + P3.P2.P1.G0
     + P3.P2.P1.P0.Cin
```

### 4️⃣ Sum Equations

```text
S0 = P0 XOR Cin
S1 = P1 XOR C1
S2 = P2 XOR C2
S3 = P3 XOR C3

Cout = C4
```

## 📂 Project Structure

```text
4-Bit-Carry-Look-Ahead-Adder/
|
|-- 📄 cla.v
|-- 📄 cla_tb.v
|-- 🖼️ waveform.png
|-- 📘 README.md
```

## 🧪 Test Cases

The design is verified using seven different test cases.

| Test Case | A | B | Cin | Sum | Cout |
|---|---:|---:|---:|---:|---:|
| 1️⃣ | 8 | 4 | 0 | 12 | 0 |
| 2️⃣ | 5 | 3 | 1 | 9 | 0 |
| 3️⃣ | 3 | 5 | 0 | 8 | 0 |
| 4️⃣ | 15 | 1 | 0 | 0 | 1 |
| 5️⃣ | 15 | 15 | 1 | 15 | 1 |
| 6️⃣ | 0 | 0 | 0 | 0 | 0 |
| 7️⃣ | 9 | 7 | 1 | 1 | 1 |

## 🔍 Test Case Explanation

1. ➕ Normal Addition: Tests addition without an input carry.
2. 🔄 Carry Input: Tests addition with Cin = 1.
3. 🔢 Basic Addition: Verifies another normal addition.
4. ⚠️ Overflow: Checks carry generation when the result exceeds 4 bits.
5. 🔥 Maximum Addition: Tests maximum input values with carry input.
6. 0️⃣ Zero Addition: Verifies addition of two zero values.
7. 📈 Carry Generation: Checks carry generation with an input carry.

## 💻 Simulation

The design was simulated using **Synopsys Verdi**.

### 🚀 Simulation Steps

1. Write the design code in `cla.v`.
2. Write the testbench code in `cla_tb.v`.
3. Compile and simulate both Verilog files.
4. Generate the simulation waveform.
5. Observe the input and output signals in Verdi.

### 🛠️ Synopsys Verilog Commands

```bash
vcs -full64 -kdb -debug_access+all cla.v cla_tb.v
```

## 📊 Simulation Results

The following signals were observed in the waveform:

- 📥 `a[3:0]` - First input.
- 📥 `b[3:0]` - Second input.
- 🔁 `c0` - Input carry.
- 📤 `S[3:0]` - Sum output.
- 📤 `Cout` - Final carry output.

✅ All seven test cases produce the expected sum and carry outputs.

### 🖼️ Simulation Waveform

![4-Bit CLA Simulation Waveform](waveform.png)

## ⭐ Advantages

- ⚡ Reduces carry propagation delay.
- 🚀 Faster than a conventional Ripple Carry Adder for comparable bit widths.
- 🔄 Generates carry signals using parallel logic.
- 💡 Suitable for high-speed arithmetic circuits.

## 🌐 Applications

- 🖥️ Arithmetic Logic Units (ALUs).
- 📡 Digital Signal Processing.
- 💻 Microprocessors.
- ⚙️ High-speed arithmetic circuits.
- 🏗️ Computer Architecture.

## 🏁 Conclusion

The 4-bit Carry Look-Ahead Adder was successfully designed and simulated using Verilog HDL.

The design uses Generate and Propagate signals to calculate carry outputs in parallel, reducing carry propagation delay compared with a Ripple Carry Adder.

✅ The simulation results match the expected outputs for all seven test cases, verifying the correct functionality of the design.

---

### 👨‍💻 Tools & Technologies

- Verilog HDL
- Synopsys Verdi
- Linux

**📌 Project Category:** Digital Electronics | VLSI Design
