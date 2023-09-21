module adder2 (
  input [1:0] a, b,
  output [1:0] sum,
  output carry
);

  assign {carry,sum} = a + b;

endmodule

module adder2_tb;

reg [1:0] x,y;
wire [1:0] z;
wire c;

adder2 u1 (.a(x),.b(y),.sum(z),.carry(c));

    initial begin
        $monitor("%t %b %b %b %b",$time,x,y,z,c);
        repeat(50) begin
            {x,y} = {$random};
            #100;
        end
        #100;
    end

endmodule