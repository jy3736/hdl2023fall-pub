`include "top.v"

module tb_cmp4;

  reg [3:0] a, b;
  wire gt, eq, lt;

  cmp4 uut (
    .a(a),
    .b(b),
    .gt(gt),
    .eq(eq),
    .lt(lt)
  );

  initial begin
    $monitor("%t %d %d %b %b %b", $time, a, b, gt, eq, lt);
    {a,b} = 0;
    #10;

    repeat(100) begin
        {a,b} = $random;
        #10;
        if (gt !== (a > b) || eq !== (a == b) || lt !== (a < b)) begin
            $display("Error: a=%d, b=%d, gt=%d, eq=%d, lt=%d", a, b, gt, eq, lt);
            $finish;
        end
    end
    $finish; 
  end

endmodule
