`timescale 1ns/1ps
`include "bcdfadd4.v"

module decode_tb;

  reg [3:0] a,b;
  reg cin;
  wire [3:0] sum;
  wire cout;

  bcdfadd4 dut2(
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
  );

  
  initial begin
    $dumpfile("wave.vcd");
    $dumpvars();    
    $monitor("%t %d %d %b %b %d", $time, a, b, cin, cout, sum);
    #100;

    repeat(100) begin
        {a,b,cin} = {$random};
        a = (a%10);
        b = (b%10);
        #100;
    end
    $finish; 
  end

endmodule

