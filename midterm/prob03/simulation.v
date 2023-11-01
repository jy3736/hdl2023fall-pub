`include "router.v"

module isodd_tb;

    reg [7:0] a;
    reg [7:0] b;
    reg [1:0] sel;
    wire [7:0] x;
    wire [7:0] y;

    router cut(
        .a(a),
        .b(b),
        .sel(sel),
        .x(x),
        .y(y)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars();
        $monitor("%t %d %d %d %d %d", $time, a, b, sel, x, y);
        
        {a,b,sel} = 0;   
        #100;

        repeat(100) begin
            {a,b,sel} = {$random};
            #100;
        end
        $finish;
    end

endmodule