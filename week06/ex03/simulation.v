`timescale 1ns/1ps
`include "alu8.v"

module decode_tb;

  reg [7:0] a, b;
  reg [2:0] opcode;
  wire [7:0] result;
  wire co;

  alu alu8(
    .a(a),
    .b(b),
    .opcode(opcode),
    .result(result),
    .co(co)
  );
  
  initial begin
    $dumpfile("wave.vcd");
    $dumpvars();    
    $monitor("%t %h %h %h %h %h", $time, a, b, opcode, co, result);
    #100;

    repeat(100) begin
        {a,b,opcode} = {$random};
        #100;
    end
    $finish; 
  end

endmodule

