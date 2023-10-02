## Exercise 1: Verilog Comparator Module (cmp4)

You are tasked with simulating a Verilog module named cmp4 that serves as a 4-bit binary comparator. This module takes two 4-bit inputs, a and b, and produces three outputs, gt, eq, and lt, indicating the comparison results between a and b.

The comparison results are defined as follows:
- gt (Greater Than): This output is asserted (1) when a is greater than b.
- eq (Equal To): This output is asserted (1) when a is equal to b.
- lt (Less Than): This output is asserted (1) when a is less than b.

Your task is to create a Verilog testbench for the cmp4 module to verify its functionality. The testbench should provide various test cases to cover different comparison scenarios and should display the results of the comparisons at each simulation step.

*Verify your solution locally.*
```
$ iverilog -o ex01 testbench.v
$ ./ex01 
                   0  0  0 0 1 0
                  10  2  4 0 0 1
                  20  8  1 1 0 0
                  30  0  9 0 0 1
                  40  6  3 1 0 0
...
Omitted for the sake of conciseness...
...
                 930  1  2 0 0 1
                 940  7 14 0 0 1
                 950  6 13 0 0 1
                 960  3  9 0 0 1
                 970  1 15 0 0 1
                 980 13  3 1 0 0
                 990  8  5 1 0 0
                1000  7  8 0 0 1
```

*Run the testing script to validate your solution.*
```
$ python ../testing.pyc 
Compilation successful.
                   0  0  0 0 1 0
                  10  2  4 0 0 1
                  20  8  1 1 0 0
                  30  0  9 0 0 1
                  40  6  3 1 0 0
...
Omitted for the sake of conciseness...
...

                 960  3  9 0 0 1
                 970  1 15 0 0 1
                 980 13  3 1 0 0
                 990  8  5 1 0 0
                1000  7  8 0 0 1

Test PASSED.
```

*If an error occurred, you might encounter an error message like this:*
```
 $ python ../testing.pyc 
Compilation successful.
                   0  0  0 0 1 0
                  10  2  4 0 0 0
Error: a= 2, b= 4, gt=0, eq=0, lt=0

Execution Error
```