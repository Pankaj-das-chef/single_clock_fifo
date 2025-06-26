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
## Testbench: single_clock_fifo_tb.v

- 1. Resets the FIFO
- 2. Writes 4 values: 10, 20, 30, 40
- 3. Reads back those 4 values
- 4. Observes buf_out, buf_empty, buf_full, and fifo_counter
- 5. Uses $monitor to log signal changes over time

 Example Monitor Output:
- Time: 40 | wr_en=1 rd_en=0 buf_in=14 buf_out=00 fifo_counter=3 full=0 empty=0
- Time: 70 | wr_en=0 rd_en=1 buf_in=14 buf_out=10 fifo_counter=3 full=0 empty=0

![Single_clock_fifo_waveform](https://github.com/user-attachments/assets/d1ec0efe-43ce-465b-b663-528eb4dfdc77)
