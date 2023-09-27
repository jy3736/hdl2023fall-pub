module adder2 (
  input [1:0] a, b,
  output [1:0] sum,
  output carry
);

  assign {carry,sum} = a + b;

endmodule