# 🧮 ALU Design in Verilog

### Overview
This project implements a **parameterized Arithmetic Logic Unit (ALU)** in **Verilog HDL**, integrating various arithmetic and logical operations.  
Each operation is designed as a modular and reusable block, promoting clarity, scalability, and efficient simulation for digital design practice.

---

## ⚙️ Modules Implemented

| Module | Function | Key Design Feature |
|:--------|:-----------|:------------------|
| **adder.v** | Performs N-bit addition | Implemented using **Ripple Carry Adder (RCA)** structure for simplicity and modularity |
| **subtractor.v** | Performs N-bit subtraction | Uses **Look-Ahead Borrow Logic** to minimize propagation delay |
| **multiplier.v** | Performs signed/unsigned multiplication | Implemented using **Booth’s Multiplication Algorithm** for efficient bit-pair encoding |
| **divide.v** | Performs unsigned division | Based on **Restoring Division Algorithm** |
| **logical.v** | Performs logical operations | Includes **AND, OR, XOR, and NOT** operations |
| **fulladder.v** | 1-bit Full Adder | Core building block used in the adder and other arithmetic units |
| **main_alu.v** | Top-level ALU Integration | Combines all arithmetic and logical modules and selects operation based on control signals |

---

## 🔧 Features

- Modular design structure — each arithmetic unit is implemented and tested independently.  
- Synthesizable Verilog code, ready for FPGA or ASIC design flow.  
- Easy-to-understand operation selection logic through a main control unit.  
- Supports both **arithmetic** and **logical** functions in one architecture.  
- Testbenches (optional to include later) validate functionality for multiple input cases.

---

## 🧠 Design Details

### 🔹 Ripple Carry Adder (RCA)
- Constructed from chained 1-bit full adders.  
- Simple structure with predictable delay proportional to bit width (O(n)).

### 🔹 Look-Ahead Borrow Subtractor
- Improves upon ripple subtraction by precomputing borrow signals.  
- Reduces latency compared to standard ripple-based subtraction.

### 🔹 Booth’s Multiplier
- Handles signed multiplication efficiently using Booth’s bit-pair recoding technique.  
- Reduces number of partial products → optimized area and timing.

### 🔹 Restoring Division Algorithm
- Used for **unsigned division**.  
- Iteratively restores remainder if subtraction overshoots, ensuring correctness with simplicity.

### 🔹 Logical Unit
- Performs fundamental bitwise operations (`AND`, `OR`, `XOR`, `NOT`).  
- Operates on the same input bus width as the arithmetic unit for uniformity.

---

## 🧩 ALU Operation Summary

| Operation | Description |
|------------|-------------|
| `000` | Addition |
| `001` | Subtraction |
| `010` | Multiplication |
| `011` | Division |
| `100` | AND |
| `101` | OR |
| `110` | XOR |
| `111` | NOT |

*(Operation codes are customizable based on implementation in `main_alu.v`.)*

---

## 🧪 Simulation & Testing

- Tested using Verilog testbenches for all modules individually.  
- Verified results for corner cases like overflow, zero division, and negative multiplication.  

## 🛠️ Tools & Environment

- **Language:** Verilog HDL  
- **Simulator:** EDA Playground  
- **OS:** Windows  

---

## 🚀 Future Enhancements

- Add **barrel shifter** for shift/rotate operations.  
- Integrate **status flags** (Zero, Carry, Overflow, Negative).  





