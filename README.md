# Verilog_ALU
This is a Verilog arithmetic logic unit designed to receive input via the switches on the Basys 3 FPGA and output the result of the operation to the onboard seven segment display.

This ALU can perform four different operations on two five bit inputs: addition, subtraction, multiplication, and shifting. The operation performed is based on 
input from the right-most switches on the Basys 3 FPGA. 00 is adding, 01 is multiplication, 10 is subtraction, and 11 is shifting the first input (switches 1-5) 2 bits to the right.

The ouput assigned from the ALU as a result of the state passes through a BCD algorithm to convert from binary to decimal digits, and then is passed to the cathode
multiplexer which cycles between each digit of the seven segment display in sync with the corresponding anodes.

Since the onboard clock is 100MHz, which is too fast to drive the display, a divider was implemented using an 18 bit counter. The slow clock is the 18th bit of the counter,
which yields a 380Hz clock. When this is used to multiplex between the four digits of the display, it results in a refresh period of 95 Hz, which is fast enough to
trick the eye.
