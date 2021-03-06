//				Ayudh Saxena 18CS10007    and    Anmol Harsh 18CS10005    
			
`timescale 1ms/1ns 

module mealy_mod5_msb(
input clk, 
input reset,
input in ,
output [2:0]out
);
reg [2:0]out;
reg [2:0]state;

parameter zero=0, a=1, b=2, c=3, d=4 ;
//out = 3'b000 ;
//state = 3'b000 ;

always @ (posedge clk or posedge reset)
begin
	if(reset)
	begin
		state <= zero;
		out <= 0;
	end
	else
	begin 
		case(state)
			zero: if(in)
				begin
					state = a ;
					out = 1;
				end
				else
				begin
					state = zero;
					out = 0 ;
				end

			a: if(in)
				begin
					state = c ;
					out = 3;
				end
				else
				begin
					state = b;
					out = 2 ;
				end

			b: if(in)
				begin
					state = zero ;
					out = 0;
				end
				else
				begin
					state = d;
					out = 4 ;
				end

			c: if(in)
				begin
					state = b ;
					out = 2;
				end
				else
				begin
					state = a;
					out = 1 ;
				end

			d: if(in)
				begin
					state = d ;
					out = 4;
				end
				else
				begin
					state = c;
					out = 3 ;
				end

		endcase
	end


end


endmodule


module mealy_msb_tb();
reg clk, reset;
wire [2:0] out ;
reg drive ; 

mealy_mod5_msb mealy1(.clk(clk), .reset(reset), .in(drive), .out(out)) ;


initial begin
        $dumpfile("mealy_mod5_msb.vcd");
        $dumpvars(0,mealy_msb_tb);

		#20;
    	clk = 0;
    	reset = 1 ;
    				#10;
    	reset = 0;
    	drive = 1;
   		    		#10;
    	reset = 0;
    	drive = 1;    	
 				   	#10;
    	reset = 0;
    	drive = 0;    	
    				#10;
    	reset = 0;
    	drive = 1;    	
    				#10;
    	reset = 0;
    	drive = 1;    	
	    			#10;
    	reset = 0;
    	drive = 0;
    		    	#10;	// input read = 110110(54) mod 5 = 4(100) ;
    	reset = 1;			//reset = 1 ,output goes to 0
    	drive = 0;    	
 		   	    	#20;

 		//new input gets processed as reset

    	reset = 0;
    	drive = 1;    	
   			    	#10;
    	reset = 0;
    	drive = 1;    	
    		    	#10;
    	reset = 0;
    	drive = 1;    	
    		    	#10;
    	reset = 0;
    	drive = 1;
    		    	#10;
    	reset = 0;
    	drive = 1;
    		    	#10;		//input read = 11111(31) mod 5 = 1(001) ; 
    	reset = 1;				//reset = 1 ,output goes to 0 again
    	drive = 1;    	    	    	
    		    	#20;

    	//new input gets processed as reset		    	

    	reset = 0;
    	drive = 0;
    		    	#10;
    	reset = 0;
    	drive = 1;    	    	
    		    	#10;
    	reset = 0;
    	drive = 0;
    		    	#10;
    	reset = 0;
    	drive = 1;    	
    				#10;
    	reset = 0;
    	drive = 1;    	
		    		#10;
    	reset = 0;
    	drive = 0;    	
    		    	#10;
    	reset = 0;
    	drive = 1;    	
    		    	#10;
    	reset = 0;
    	drive = 0;    	
    		    	#10;
    	reset = 0;
    	drive = 1;    	
    		    	#10;
    	reset = 0;
    	drive = 1;    			//input read = 0101101011(723) mod 5 = 3(011) ;

    	//finished reading input
    	$finish;	
    end
		always #5 clk = ~clk;
	initial    
		$monitor($time,"ms Mealy_MSB  reset=%b, input=%b, output=%b",reset, drive, out);

endmodule
