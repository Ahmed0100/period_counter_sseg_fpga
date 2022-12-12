module sseg_time_mux
(
	input clk,
	input [3:0] hex0,hex1,hex2,hex3,
	input [3:0] dp,
	output reg [3:0] sel,
	output [7:0] sseg
);

localparam N=18;
reg [N-1:0] q_reg;
wire [N-1:0] q_next;
reg [3:0] hex_in;
reg dp_in;
always @(posedge clk)
begin
	q_reg <= q_next;
end

assign q_next = q_reg +1;

always @(*)
	case(q_reg[N-1:N-2])
		2'b00: begin
				sel= 4'b1110;
				hex_in= hex0;
				dp_in = dp[0];
		end
		2'b01: begin
				sel=4'b1101;
				hex_in= hex1;
				dp_in = dp[1];
		end
		2'b10: begin
				sel=4'b1011;
				hex_in = hex2;
				dp_in = dp[2];
		end
		default: begin
				sel=4'b0111;
				hex_in= hex3;
				dp_in = dp[3];
		end
	endcase

hex_to_sseg hex_to_sseg_inst
(
	.hex(hex_in),
	.dp(dp_in),
	.sseg(sseg)
);

endmodule