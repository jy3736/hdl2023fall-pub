## Exercise 2: Verilog Odd Number Detector (isodd)

You are tasked with simulating a Verilog module named isodd that serves as an odd number detector. This module takes a 4-bit input a and produces a single output x, which indicates whether the input number is odd or even.

The functionality of the isodd module is defined as follows:
- The output x is asserted (1) when the least significant bit (LSB) of the input a is 1, indicating that the input number is odd.
- The output x is de-asserted (0) when the LSB of the input a is 0, indicating that the input number is even.

Your task is to create a Verilog testbench for the isodd module to verify its functionality. The testbench should provide various test cases to cover different scenarios of odd and even numbers and should display the results accordingly.

*Verify your solution locally.*
```
$ iverilog -o ex02 testbench.v
$ ./ex02
VCD info: dumpfile isodd_tb.vcd opened for output.
                   0 0000 0
                  10 0100 0
                  20 0001 1
                  30 1001 1
                  40 0011 1
...
Omitted for the sake of conciseness...
...
                 950 1101 1
                 960 1001 1
                 970 1111 1
                 980 0011 1
                 990 0101 1
                1000 1000 0
```

*Run the testing script to validate your solution.*
```
$ python ../testing.pyc 
Compilation successful.
VCD info: dumpfile isodd_tb.vcd opened for output.
                   0 0000 0
                  10 0100 0
                  20 0001 1
                  30 1001 1
                  40 0011 1
...
Omitted for the sake of conciseness...
...
                 950 1101 1
                 960 1001 1
                 970 1111 1
                 980 0011 1
                 990 0101 1
                1000 1000 0

Test PASSED.
```

*If an error occurred, you might encounter an error message like this:*
```
 $ python ../testing.pyc 
Compilation successful.
VCD info: dumpfile isodd_tb.vcd opened for output.
                   0 0000 0
                  10 0100 0
                  20 0001 0
Error: 0 != 00000000000000000000000000000001

Execution Error
```