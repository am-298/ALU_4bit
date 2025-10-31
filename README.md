# 8-bit-ALU-in-Verilog


## Introduction
This repository features a fully implemented 4-bit Arithmetic Logic Unit (ALU) capable of performing a wide range of arithmetic and logical operations. The ALU is a critical component in digital systems, including CPUs and GPUs, designed to handle both computational and logical tasks.

Key Features:
### Arithmetic Operations:

`Addition
`Subtraction
`Multiplication
`Division

### Logical Operations:

> | AND  |
> OR   |
> NOT  |
> XOR  | 
> XNOR |
> NAND |
> NOR  |

Each operation is triggered by a unique opcode, ensuring accurate execution. This design makes the ALU flexible and efficient for diverse tasks.

<p align='center'>
    <img src='images/Mitchell_ALU_block.webp' width=500 height=300>
</p>

An ALU takes **operands** as input data and **opcodes** to specify the operation to be performed. These inputs enable the ALU to execute arithmetic and logical operations effectively.


## Opcodes  

<p align = 'center'>
    <img src='images/operation.png' width=250 height=250>
</p>

### Architecture:

Adder :- Ripple Carry adder(RCA)

The Ripple Carry Adder is a simple and intuitive digital circuit for binary addition. It chains full adders together, where the carry-out from one bit position "ripples" to the carry-in of the next, propagating sequentially from the least significant bit (LSB) to the most significant bit (MSB).

Key Features:

Structure: Composed of n full adders (one per bit), each handling a pair of input bits (A_i, B_i) plus a carry-in (C_i).
Operation: Sum bit S_i = A_i XOR B_i XOR C_i; Carry-out C_{i+1} = (A_i AND B_i) OR (A_i AND C_i) OR (B_i AND C_i).
Advantages: Low hardware overhead (O(n) gates), easy to implement.
Drawbacks: Carry propagation delay is O(n), limiting speed for large word sizes (e.g., 32-bit).
Use in ALU: Handles unsigned/signed addition with overflow detection.

Example Waveform (Conceptual): For 4-bit addition of 1011 (11) + 0011 (3) = 1110 (14), carries ripple as: C1=1, C2=1, C3=0, C4=0.
Implementation files: ripple_carry_adder.v (Verilog module with testbench).

Subtractor :- Look ahead borrow 
Multipication :- Booth's Algorithm
Division :- Restoring division
