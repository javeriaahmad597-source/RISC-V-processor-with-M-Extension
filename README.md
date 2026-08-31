# RISC-V RV32I Multiplier Co-Processor

A complete hardware implementation of an integer-only RISC-V core (RV32I) with an integrated multiplier co-processor, designed as part of the Computer System Architecture course.

## Overview

This project implements a full RISC-V datapath with a custom hardware multiplier co-processor. The multiplier interfaces cleanly with the existing pipeline and supports multiple multiplication modes including signed, unsigned, and mixed-sign operations.

## Features

- **Full RV32I Datapath** — Program Counter, Register File, ALU, Instruction/Data Memory
- **Hardware Multiplier Co-Processor** — Dedicated FSM-based multiplication unit
- **Branch Support** — BEQ, BNE, BLT, BGE, BLTU, BGEU
- **Memory Operations** — LB, LH, LW, LBU, LHU, SB, SH, SW
- **Immediate Generation** — I-type, S-type, B-type immediate support
- **Modular Design** — Each component has an independent testbench

## Architecture

### Core Modules

| Module | Description |
|--------|-------------|
| `ALU` | 32-bit Arithmetic Logic Unit with branch comparison |
| `Register_File` | 32-entry x 32-bit register file |
| `Program_Counter` | PC with branch and multiplier stall support |
| `Instruction_Memory` | Instruction ROM (parameterized depth) |
| `Data_Memory` | Byte-addressable data memory with load/store |
| `Immediate_Gen` | Immediate extraction for I/S/B-type instructions |
| `Control_Unit` | Main control + ALU control + multiplier decode |
| `Branch_adder` | Branch target address calculator |

### Multiplier Co-Processor

| Module | Description |
|--------|-------------|
| `Multiplier_co_processor` | Top-level multiplier with 32-cycle shift-add algorithm |
| `FSM` | 4-state controller (IDLE → COMPUTE → COMPLETE → NEXT) |
| `mul_register` | Multiplicand register initialization |

**Supported MUL Instructions:**
- `MUL`   — Lower 32 bits (signed × signed)
- `MULH`  — Upper 32 bits (signed × signed)
- `MULHSU` — Upper 32 bits (signed × unsigned)
- `MULHU` — Upper 32 bits (unsigned × unsigned)

## Simulation

Each module includes a dedicated SystemVerilog testbench:

```bash
# Example: simulate ALU
iverilog -g2012 -o alu_sim.vvp ALU.sv tb_alu.sv
vvp alu_sim.vvp
gtkwave dump.vcd
