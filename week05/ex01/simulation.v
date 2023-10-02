`include "decode.v"

module decode_tb;

  reg [3:0] din;
  wire odd, even, zero;

  decode dut(
    .din(din),
    .odd(odd),
    .even(even),
    .zero(zero)
  );

  initial begin
    $dumpfile("wave.vcd");
    $dumpvars();    
    $monitor("%d %b %b %b", din, odd, even, zero);
    din = 0;
    #100;

    repeat(100) begin
        din = {$random};
        #100;
    end
    $finish; 
  end

endmodule
