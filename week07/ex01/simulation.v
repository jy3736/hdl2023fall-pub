`timescale 1ns / 1ps
`include "RegFile.v"

module tb_RegFile;

    reg [3:0] raddr1;
    reg [3:0] raddr2;
    reg [3:0] waddr;
    reg we;
    reg clk;
    reg [7:0] wdata;
    wire [7:0] rdata1;
    wire [7:0] rdata2;


    RegFile dut(
        .raddr1(raddr1),
        .raddr2(raddr2),
        .waddr(waddr),
        .we(we),
        .clk(clk),
        .wdata(wdata),
        .rdata1(rdata1),
        .rdata2(rdata2)
    );

    integer i;

    initial begin
        clk = 0;
        {raddr1, raddr2, waddr, we, wdata} = 0;
        forever #50 clk = ~clk;
    end

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars();    
        $monitor("%t %h %h %h %h %h %h %h", $time, raddr1, raddr2, waddr, we, wdata, rdata1, rdata2);
        #100;

        i = 0;
        we = 1;
        repeat(16) begin
            waddr = i;
            wdata = {$random};
            wait(clk==1);
            #50;
            i = i + 1;
            wait(clk==0);
            #50;
        end

        we = 0;
        repeat(32) begin
            raddr1 = {$random} % 16;
            raddr2 = {$random} % 16;
            wait(clk==1);
            wait(clk==0);
        end        
        $finish; 
    end

endmodule