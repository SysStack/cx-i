module simple_processor(
    input [7:0] input_a,
    input [7:0] input_b,
    input [1:0] op,
    output reg [15:0] result
);

always @(*)
begin
    case(op)
        2'b00: result = input_a + input_b;
        2'b01: result = input_a - input_b;
        2'b10: result = input_a * input_b;
        2'b11: result = input_a / input_b;
    endcase
end

endmodule
