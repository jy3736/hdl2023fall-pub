module bcdfadd4(
  input wire [3:0] a,
  input wire [3:0] b,
  input wire cin,
  output wire [3:0] sum,
  output wire cout
);

  reg [4:0] _sum;

  assign sum = _sum[3:0];
  assign cout = _sum[4];
  
  always @* begin
    _sum = a + b + cin;
    if (_sum > 9) begin
      _sum = _sum - 10;
      _sum[4] = 1'b1;
    end
  end
  
endmodule
