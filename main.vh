module cx(
    input clk,
    input reset,
    input [7:0] input_a,
    input [7:0] input_b,
    input [3:0] op,
    output reg [15:0] result
);

reg [7:0] reg_a;
reg [7:0] reg_b;
reg [3:0] reg_op;

always @(posedge clk)
begin
    if(reset) begin
        reg_a <= 8'b0;
        reg_b <= 8'b0;
        reg_op <= 4'b0;
        result <= 16'b0;
    end else begin
        reg_a <= input_a;
        reg_b <= input_b;
        reg_op <= op;
        case(reg_op)
            4'b0000: result <= reg_a + reg_b; // addition
            4'b0001: result <= reg_a - reg_b; // subtraction
            4'b0010: result <= reg_a * reg_b; // multiplication
            4'b0011: result <= reg_a / reg_b; // division
            4'b0100: result <= reg_a & reg_b; // AND
            4'b0101: result <= reg_a | reg_b; // OR
            4'b0110: result <= reg_a ^ reg_b; // XOR
            default: result <= 16'b0; // unknown operation
        endcase
    end
end

endmodule // cx
