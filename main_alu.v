module alu (
    input clk,
    input [3:0] opcode,    // Opcode for operation selection
    input [3:0] a,         // 4-bit input A
    input [3:0] b,         // 4-bit input B
    output reg [8:0] out   // 10-bit output to accommodate results
);

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
