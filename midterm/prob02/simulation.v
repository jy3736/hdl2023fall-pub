`timescale 1ns/1ps
`include "bcdfadd16.v"

module decode_tb;

  reg [15:0] a,b;
  reg cin;
  wire [15:0] sum;
  wire cout;

  bcdfadd16 dut2(
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
  );

  
  initial begin
    $dumpfile("wave.vcd");
    $dumpvars();    
    $monitor("%t %h %h %b %b %h", $time, a, b, cin, cout, sum);
    #100;

    repeat(100) begin
        a[3:0]   = {$random} % 10;
        a[7:4]   = {$random} % 10;
        a[11:8]  = {$random} % 10;
        a[15:12] = {$random} % 10;
        b[3:0]   = {$random} % 10;
        b[7:4]   = {$random} % 10;
        b[11:8]  = {$random} % 10;
        b[15:12] = {$random} % 10;
        cin      = {$random};
        #100;
    end
    $finish; 
  end

endmodule

