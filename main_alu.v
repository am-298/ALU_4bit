module alu (
    input clk,
    input [3:0] opcode,    // Opcode for operation selection
    input [3:0] a,         // 4-bit input A
    input [3:0] b,         // 4-bit input B
    output reg [9:0] out   // 10-bit output to accommodate results
);
    wire [9:0] add_out;    // Output from adder
    wire [9:0] sub_out;    // Output from subtractor
    wire [9:0] mul_out;    // Output from multiplier
    wire [9:0] div_out;    // Output from divider
    wire [9:0] log_out;    // Output from logical operations

    // Instantiate adder module
    adder u1 (
        .clk(clk),
        .a(a),
        .b(b),
        .out(add_out)
    );

    // Instantiate subtractor module
    subtractor u2 (
        .clk(clk),
        .a(a),
        .b(b),
        .out(sub_out)
    );

    // Instantiate multiplier module
    multiplier u3 (
        .clk(clk),
        .a(a),
        .b(b),
        .out(mul_out)
    );

    // Instantiate divider module
    divide u4 (
        .clk(clk),
        .a(a),
        .b(b),
        .out(div_out)
    );

    // Instantiate logical operations module
    logical u5 (
        .opcode(opcode),
        .clk(clk),
        .a(a),
        .b(b),
        .out(log_out)
    );

    // Select the operation based on the opcode
    always @(posedge clk) begin
        case (opcode)
            4'b0000: out = add_out;  // Addition
            4'b0001: out = sub_out;  // Subtraction
            4'b0010: out = mul_out;  // Multiplication
            4'b0011: out = div_out;  // Division
            4'b0100: out = log_out;  // Logical operations
            default: out = 10'b0;    // Default: Zero
        endcase
    end
endmodule
