## Exercise 2: Simple Router Module Design

You have been tasked with designing a basic router module as illustrated below. This router module is equipped with two input ports, 'a' and 'b,' as well as two output ports, 'x' and 'y.' The 'sel' input signal is used to determine the connection between the input and output ports based on the following routing table:

- When sel = 0, 'a' is routed to 'x,' and 'b' is routed to 'y.'
- When sel = 1, 'a' is routed to 'y,' and 'b' is routed to 'x.'
- When sel = 2, 'a' is routed to both 'x' and 'y.'
- When sel = 3, 'b' is routed to both 'x' and 'y.'
- For all other values of sel, '0' is routed to both 'x' and 'y.'

Here's the Verilog code for the router module:

```verilog
module router(
    input [7:0] a,
    input [7:0] b,
    input [1:0] sel,
    output [7:0] x,
    output [7:0] y
);
```

*Simulate your design locally.*
```shell
[ex02]$ iverilog -o ex02 simulation.v 
[ex02]$ ls
README.md  ex02  router.v  simulation.v testbench.v.enc
[ex02]$ ./ex02
VCD info: dumpfile wave.vcd opened for output.
                   0   0   0 0   0   0
                 100  77  73 0  77  73
                 200  87 160 1 160  87
                 300  53 130 1 130  53
                 400  21 152 3 152 152
...
... (omitted for brevity)
...
                9600 121 206 1 206 121
                9700 163 199 3 199 199
                9800 253 180 3 180 180
                9900  75 225 1 225  75
               10000  34  30 0  34  30
```

*Run the testing script to validate your solution.*
```shell
[ex02]$ python ../testing.pyc
Compilation successful.
VCD info: dumpfile wave.vcd opened for output.
                   0   0   0 0   0   0
                 100  77  73 0  77  73
                 300  87 160 1 160  87
                 500  53 130 1 130  53
                 700  21 152 3 152 152
                 900  94 195 1 195  94
...
... (omitted for brevity)
...
               19100 121 206 1 206 121
               19300 163 199 3 199 199
               19500 253 180 3 180 180
               19700  75 225 1 225  75
               19900  34  30 0  34  30

Test PASSED.
```
