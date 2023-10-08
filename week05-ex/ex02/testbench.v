`include "top.v"

module isodd_tb;

    reg [3:0] a;
    wire x;

    isodd uut (
        .a(a),
        .x(x)
    );

    initial begin
        $dumpfile("isodd_tb.vcd");
        $dumpvars();
        $monitor("%t %b %b", $time, a, x);
        a = 4'b0000;
        #10;
        repeat(100) begin
            a = {$random};
            #10;
            if (x != a%2) begin
                $display("Error: %b != %b", x,a%2);
                $finish;
            end
        end
        $finish;
    end

endmodule