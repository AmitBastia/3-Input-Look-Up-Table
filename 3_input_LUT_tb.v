`include "3_input_LUT.v"
`timescale 1ns/1ps
module LUT_tb;
    reg clk;
    reg en, S;
    reg A,B,C;
    wire z;
    top_module DUT(clk,en,S,A,B,C,z);
        always #5 clk=~clk;
        initial
            begin
                clk=0;
                en=0;S=0;A=0;B=0;C=0; #5
                $dumpfile("LUT.vcd");
                $dumpvars;
                $monitor($time, "En=%b, S=%b, A=%b, B=%b, C=%b, z=%b", en, S, A,
                         B, C, z);
                en=1;
                S=1; #10
                S=0; #10
                S=1; #10
                S=0; #10
                S=1; #10
                S=0; #10
                S=1; #10
                S=0; #10

                en=0;
                A=0;B=0;C=0; #10
                A=0;B=0;C=1; #10
                A=0;B=1;C=0; #10
                A=0;B=1;C=1; #10
                A=1;B=0;C=0; #10
                A=1;B=0;C=1; #10
                A=1;B=1;C=0; #10
                A=1;B=1;C=1; #10
                $finish;
            end
endmodule
