# 🔁 Single Clock FIFO in Verilog

A simple and efficient **Single Clock FIFO (First-In-First-Out)** buffer implemented in Verilog. This FIFO supports synchronous read/write operations using a single clock and handles data storage with a depth of 64 bytes.

---

## 📌 Overview

This project implements a 64-depth FIFO memory buffer using a single clock domain. It is useful in digital systems for buffering data between producer and consumer logic blocks running on the same clock.

---

## 🚀 Features

- 64-byte deep FIFO (`buf_mem [63:0]`)
- 8-bit data width
- Read and write with independent control signals
- `buf_empty` and `buf_full` flags
- `fifo_counter` to monitor current occupancy
- Synchronous operations using one clock
- Resettable using active-high `rst`

---

