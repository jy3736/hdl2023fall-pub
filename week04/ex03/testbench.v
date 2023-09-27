`include "top.v"

module adder2_tb;

reg [1:0] x,y;
wire [1:0] z;
wire c;

adder2 u1 (.a(x),.b(y),.sum(z),.carry(c));

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
        $monitor("%t %b %b %b %b",$time,x,y,z,c);
        repeat(50) begin
            {x,y} = {$random};
            #100;
            if ({c,z}!==x+y) begin 
                $display("Error: %b + %b = %b %b",$time,x,y,z,c);
                $finish(1);
            end

        end
        #100;
        $finish(0);
    end

endmodule