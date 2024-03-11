# 16-Bit-CPU-Design
<img width="529" alt="Untitled" src="https://github.com/danielcaspi/16-Bit-CPU-Design/assets/145657550/8a0a231a-e3cd-47a2-835e-2dbb7c5cd0b8">

The Instruction Set:

The instruction set plays a very important role to determine the operation of the CPU. The Code input to the Instruction memory is 16-bit long. This is sent to the instruction register which takes the bits [15:12] as OPCODE and [11:0] as address to start with.

The instruction set are designed in a way to achieve all the necessary functions. Since the OPCODE controls the activity, the OPCODE is used as described below.

The last bit of the code input acts as a mode selection for ALU. Remaining 3 are used for the ALU operation.

0000 - Mode 0, Arithmetic Unit for ADD

0001 - Mode 0, Arithmetic Unit for Multiply

0010 - Mode 0, Arithmetic Unit for Subtract

0011 - Mode 0, Arithmetic Unit for Division

0100 - Instruction set for Load A

0101 - Instruction set for Load B

0110 - Instruction set for Load C

0111 - Instruction set for jumping to immediate address

1000 - Mode 1, Logical AND

1001 - Mode 1, Logical OR

1010 - Mode 1, Logical NAND

1011 - Mode 1, Logical NOR

1100 - Mode 1, Logical NOT A

1101 - Mode 1, Logical NOT B

1110 - Mode 1, Logical XOR

1111 - Mode 1, Logical XNOR
