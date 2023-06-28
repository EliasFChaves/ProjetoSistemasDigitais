module CONTROL(Clk, K, Load, Sh, Ad, St, M, Idle, Done, Reset);
	input Clk, K, St, M, Reset;
	output reg Idle, Sh, Done, Load, Ad;

	// Declare state register
	reg		[1:0]state;

	// Declare states
	parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3;

	// Output depends only on the state
	always @ (state or St or M) begin
		case (state)
			S0: begin
				Idle = 1; Load =0; Sh=0; Ad=0; Done=0;
				if (St) Load = 1;
			end
			S1:begin
				Idle = 0; Load =0; Sh=0; Ad=0; Done=0;
				if(M) Ad=1;
			end
			S2:begin
				Idle = 0; Load =0; Sh=1; Ad=0; Done=0;
			end
			S3:begin
				Idle = 0; Load =0; Sh=0; Ad=0; Done=1;
			end
			default:begin
				Idle = 0; Load =0; Sh=0; Ad=0; Done=0;
			end
		endcase
	end

	// Determine the next state
	always @ (posedge Clk or posedge Reset) begin
		if (Reset)
			state <= S0;
		else
			case (state)
				S0:
					if(St) state <= S1;
					else state <= S0;
				S1:
					state <= S2;
				S2:
					if (K)
						state <= S3;
					else
						state <= S1;
				S3:
					state <= S0;
			endcase
	end
	
endmodule
