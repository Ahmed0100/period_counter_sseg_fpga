module period_counter(
	input clk,reset_n,
	input start, si,
	output reg ready,
	output [9:0] period
);
localparam [1:0]
idle=2'b00,
waite=2'b01,
count=2'b10,
done=2'b11;
localparam CLK_MS_COUNT=50000;
reg [1:0] current_state,next_state;
reg[15:0] t_reg,t_next;
reg[9:0] p_reg,p_next;
reg delay_reg;
wire edg;

always @(posedge clk or negedge reset_n)
begin
	if(~reset_n)
	begin
		current_state<=idle;
		t_reg<=0;
		p_reg<=0;
		delay_reg<=0;
	end
	else
	begin
		current_state<=next_state;
		t_reg<=t_next;
		p_reg<=p_next;
		delay_reg<=si;
	end
end
assign edg=~delay_reg & si;
always @*
begin
	next_state = current_state;
	ready=0;
	p_next=p_reg;
	t_next=t_reg;
	case(current_state)
	idle:
	begin
		ready=1;
		if(start)
			next_state=waite;		
	end
	waite:
	begin
		if(edg)
		begin
			next_state = count;
			t_next=0;
			p_next=0;
		end
	end
	count:
	begin
		if(edg)
			next_state = done;
		else
			if(t_reg == CLK_MS_COUNT-1)
			begin
				t_next = 0;
				p_next=p_reg+1;
			end
			else
				t_next=t_next+1;
	end
	done:
	begin
		next_state = done;
	end
	endcase
end
assign period=p_reg;
endmodule