## Exercise 3: Structural Modeling of a Ripple Carry Adder

Your task is to create a structural model of an 8-bit ripple carry adder. This design should be modular and utilize the full adder module (`fadd`) within the working directory. The implementation should be in Verilog and subsequently tested with the provided testing script.

Below is the Verilog code for the 8-bit ripple carry adder module:

```verilog
`include "fadd.v"

module rpfadd8(
    input cin,
    input [7:0] a,
    input [7:0] b,
    output [7:0] sum,
    output cout
);
```

*Simulate your design locally.*
```shell
[ex03]$ iverilog -o ex03 simulation.v 
[ex03]$ ./ex03 
VCD info: dumpfile wave.vcd opened for output.
                   0   0   0 0   0 0
                 100 154 146 0  44 1
                 200 175  64 1 240 0
                 300 107   4 1 112 0
                 400  43  49 1  93 0
                 500 189 134 1  68 1
...
... (omited for brevity)
...
                9500 192 182 1 119 1
                9600 243 156 1 144 1
                9700  71 143 1 215 0
                9800 251 105 1 101 1
                9900 151 194 1  90 1
               10000  68  60 0 128 0
```

*Run the testing script to validate your solution.*
```shell
[ex03]$ python ../testing.pyc 
Compilation successful.
VCD info: dumpfile wave.vcd opened for output.
                   0   0   0 0   0 0
                 100 154 146 0  44 1
                 300 175  64 1 240 0
                 500 107   4 1 112 0
                 700  43  49 1  93 0
                 900 189 134 1  68 1
...
... (omited for brevity)
...
               18900 192 182 1 119 1
               19100 243 156 1 144 1
               19300  71 143 1 215 0
               19500 251 105 1 101 1
               19700 151 194 1  90 1
               19900  68  60 0 128 0

Test PASSED.
```
