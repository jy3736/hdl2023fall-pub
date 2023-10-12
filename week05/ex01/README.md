## Exercise 1: Decoder Design

Design a decoder module that takes a 4-bit vector (din) as input and produces the following outputs: 'odd,' 'even,' and 'zero.' You must use always and if statements to implement the `decode` module. The module name and interface are as follows:

```verilog
module decode(
    input [3:0] din,
    output odd,
    output even,
    output zero
);
```

*Simulate your design locally.*
```shell
[ex01]$ iverilog -o ex01 simulation.v 
[ex01]$ ls
README.md  decode.v  ex01  simulation.v  testbench.v.enc
[ex01]$ ./ex01
 0 0 0 1
 4 0 1 0
 1 1 0 0
 9 1 0 0
...
... (omitted for brevity)
...
14 0 1 0
13 1 0 0
 9 1 0 0
15 1 0 0
 3 1 0 0
 5 1 0 0
 8 0 1 0
```

*Run the testing script to validate your solution.*
```shell
[ex01]$ python ../testing.pyc
Compilation successful.
 0 0 0 1
 4 0 1 0
 1 1 0 0
 9 1 0 0
 3 1 0 0
...
... (omitted for brevity)
...
13 1 0 0
 9 1 0 0
15 1 0 0
 3 1 0 0
 5 1 0 0
 8 0 1 0

Test PASSED.
```
