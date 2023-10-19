module NextPC (
    input clk,      // Positive clock (clk) edge trigger
    input br,       // Branch condition
    input im,       // Immediate condition
    input [15:0] cur, // Current program counter
    input [15:0] addr, // Address to jump to
    input [7:0] imm,   // Offset for the branch
    output [15:0] next // Output program counter
);

    // write your code here

endmodule
