module period_counter_top
(
	input clk,
	reset_n,
	input start,
	input si,
	output ready,
	output [7:0] sseg,
	output [3:0] sel
);

wire [9:0] f;
wire start_db;
wire done_tick;
wire [3:0] bcd [3:0];
wire si_db;

db_fsm db_fsm_inst
(
	.clk(clk),
	.reset_n(reset_n),
	.sw(!start),
	.db(start_db)
);

db_fsm db_fsm_inst_2
(
	.clk(clk),
	.reset_n(reset_n),
	.sw(!si),
	.db(si_db)
);

period_counter period_counter_inst
(
	.clk(clk),.reset_n(reset_n),
	.start(start_db),
	.si(si_db),
	.ready(ready),
	.period(f)
);

bin_to_bcd bin_to_bcd_inst
(
   .bin({5'b0,f}),
   .bcd({bcd[3],bcd[2],bcd[1],bcd[0]})   
);

sseg_time_mux sseg_time_mux_inst
(
	.clk(clk),
	.hex0(bcd[0]),.hex1(bcd[1]),.hex2(bcd[2]),.hex3(4'b1001),
	.dp(4'b1110),
	.sel(sel),
	.sseg(sseg)
);

endmodule