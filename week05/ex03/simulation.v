`include "rpfadd8.v"

module rpfadd8_tb;

    reg [7:0] a;
    reg [7:0] b;
    reg cin;
    wire [7:0] sum;
    wire cout;

    rpfadd8 u0 (
        .cin(cin),
        .a(a),
        .b(b),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars();
        $monitor("%t %d %d %d %d %d", $time, a, b, cin, sum, cout);
        
        {a,b,cin} = 0;   
        #100;

        repeat(100) begin
            {a,b,cin} = {$random};
            #100;
        end
        $finish;
    end

endmodule