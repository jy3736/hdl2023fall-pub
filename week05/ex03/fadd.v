module fadd(
    input cin,
    input a,
    input b,
    output sum,
    output cout
);

    assign {cout,sum} = a + b + cin;
    
endmodule
