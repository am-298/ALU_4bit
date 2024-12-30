`timescale 1ns / 1ps

module alu_testbench;

    // Inputs
    reg clk;
    reg [3:0] a, b;
    reg [3:0] opcode;

    // Outputs
    wire [9:0] add_out;
    wire [9:0] sub_out;
    wire [9:0] mul_out;
    wire [9:0] div_out;
    wire [9:0] logic_out;

    // Instantiate the modules
    adder add_module (.clk(clk), .a(a), .b(b), .out(add_out));
    subtractor sub_module (.clk(clk), .a(a), .b(b), .out(sub_out));
    multiplier mul_module (.clk(clk), .a(a), .b(b), .out(mul_out));
    divide div_module (.clk(clk), .a(a), .b(b), .out(div_out));
    logical logic_module (.opcode(opcode), .clk(clk), .a(a), .b(b), .out(logic_out));

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        a = 4'b0;
        b = 4'b0;
        opcode = 4'b0;

        // Wait for reset
        #10;

        // Test addition
        a = 4'b1010; // 10
        b = 4'b0101; // 5
        #10;

        // Test subtraction
        a = 4'b1100; // 12
        b = 4'b0110; // 6
        #10;

        // Test multiplication
        a = 4'b0011; // 3
        b = 4'b0010; // 2
        #10;

        // Test division
        a = 4'b1000; // 8
        b = 4'b0010; // 2
        #10;

        // Test logical operations
        opcode = 4'b0101; // OR
        a = 4'b1100; // 12
        b = 4'b1010; // 10
        #10;

        opcode = 4'b0110; // AND
        a = 4'b1111; // 15
        b = 4'b1010; // 10
        #10;

        opcode = 4'b0111; // NOT (a)
        #10;

        opcode = 4'b1000; // XOR
        #10;

        // Test divide-by-zero case
        a = 4'b1010; // 10
        b = 4'b0000; // 0
        #10;

        $finish;
    end

    // Dump waveform
    initial begin
        $dumpfile("alu_testbench.vcd");
        $dumpvars(0, alu_testbench);
    end

endmodule
