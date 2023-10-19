`timescale 1ns / 1ps
`include "NextPC.v"

module tb_NextPC;

    reg clk, br, im;
    reg [15:0] cur, addr;
    reg [7:0] imm;
    wire [15:0] next;

    NextPC U1 (
        .clk(clk),
        .br(br),
        .im(im),
        .cur(cur),
        .addr(addr),
        .imm(imm),
        .next(next)
    );

    integer i;

    initial begin
        clk = 0;
        br = 0;
        im = 0;
        cur = 0;
        addr = 0;
        imm = 0;
        forever #50 clk = ~clk;
    end

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars();    
        $monitor("%t %b %b %b %h %h %h %h", $time, clk, br, im, cur, addr, imm, next);
        #100;

        br = 0;
        repeat(10) begin
            im = {$random} % 2;
            cur = {$random} % 65536;
            addr = {$random} % 65536;
            imm = {$random} % 256;
            wait(clk==1);
            #10;
            wait(clk==0);
            #10;
        end

        br = 1;
        repeat(10) begin
            im = {$random} % 2;
            cur = {$random} % 65536;
            addr = {$random} % 65536;
            imm = {$random} % 256;
            wait(clk==1);
            #10;
            wait(clk==0);
            #10;
        end

        $finish; 
    end

endmodule