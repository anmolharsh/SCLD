//              Ayudh Saxena 18CS10007    and    Anmol Harsh 18CS10005    
            
`timescale 1ms/1ns 

module mealy_mod5_lsb(
input clk, 
input reset,
input in ,
output [2:0]out
);
reg [2:0]out;
reg [4:0]state;

parameter
zero = 0, 
s10 = 1 ,
s11 = 2 ,
s12 = 3 ,
s13 = 4 ,
s14 = 5 ,

s20 = 6 ,
s21 = 7 ,
s22 = 8 ,
s23 = 9 ,
s24 = 10 ,

s30 = 11 ,
s31 = 12 ,
s32 = 13 ,
s33 = 14 ,
s34 = 15 ,

s40 = 16 ,
s41 = 17 ,
s42 = 18 ,
s43 = 19 ,
s44 = 20 ;

always @ (posedge clk or posedge reset)
begin
    if(reset)
    begin
        state = zero;
        out = 0;
    end
    else
    begin 
        case(state)
            zero:begin
                if(in)
                begin
                    out = 1;
                    state = s11 ; 
                end
                else
                begin
                    out = 0;
                    state = s10 ;
                end
            end

            s10:begin
                if(in)
                begin
                    out = 2;
                    state = s22 ; 
                end
                else
                begin
                    out = 0;
                    state = s20 ;
                end
            end

            s11:begin
                if(in)
                begin
                    out = 3;
                    state = s23 ; 
                end
                else
                begin
                    out = 1;
                    state = s21 ;
                end
            end

            s12:begin
                if(in)
                begin
                    out <= 4;
                    state <= s24 ; 
                end
                else
                begin
                    out = 2;
                    state = s22 ;
                end
            end

            s13:begin
                if(in)
                begin
                    out = 0;
                    state = s20 ; 
                end
                else
                begin
                    out = 3;
                    state = s23 ;
                end
            end

            s14:begin
                if(in)
                begin
                    out = 1;
                    state = s21 ; 
                end
                else
                begin
                    out = 4;
                    state = s24 ;
                end
            end

            s20:begin
                if(in)
                begin
                    out = 4;
                    state = s44 ; 
                end
                else
                begin
                    out = 0;
                    state = s40 ;
                end
            end

            s21:begin
                if(in)
                begin
                    out = 0;
                    state = s40 ; 
                end
                else
                begin
                    out = 1;
                    state = s41 ;
                end
            end

            s22:begin
                if(in)
                begin
                    out = 1;
                    state = s41 ; 
                end
                else
                begin
                    out = 2;
                    state = s42 ;
                end
            end

            s23:begin
                if(in)
                begin
                    out = 2;
                    state = s42 ; 
                end
                else
                begin
                    out = 3;
                    state = s43 ;
                end
            end

            s24:begin
                if(in)
                begin
                    out = 3;
                    state = s43 ; 
                end
                else
                begin
                    out = 4;
                    state = s44 ;
                end
            end

            s40:begin
                if(in)
                begin
                    out = 3;
                    state = s33 ; 
                end
                else
                begin
                    out = 0;
                    state = s30 ;
                end
            end

            s41:begin
                if(in)
                begin
                    out = 4;
                    state = s34 ; 
                end
                else
                begin
                    out = 1;
                    state = s31 ;
                end
            end

            s42:begin
                if(in)
                begin
                    out = 0;
                    state = s30 ; 
                end
                else
                begin
                    out = 2;
                    state = s32 ;
                end
            end

            s43:begin
                if(in)
                begin
                    out = 1;
                    state = s31 ; 
                end
                else
                begin
                    out = 3;
                    state = s33 ;
                end
            end

            s44:begin
                if(in)
                begin
                    out = 2;
                    state = s32 ; 
                end
                else
                begin
                    out = 4;
                    state = s34 ;
                end
            end

            s30:begin
                if(in)
                begin
                    out = 1;
                    state = s11 ; 
                end
                else
                begin
                    out = 0;
                    state = s10 ;
                end
            end

            s31:begin
                if(in)
                begin
                    out = 2;
                    state = s12 ; 
                end
                else
                begin
                    out = 1;
                    state = s11 ;
                end
            end

            s32:begin
                if(in)
                begin
                    out = 3;
                    state = s13 ; 
                end
                else
                begin
                    out = 2;
                    state = s12 ;
                end
            end

            s33:begin
                if(in)
                begin
                    out = 4;
                    state = s14 ; 
                end
                else
                begin
                    out = 3;
                    state = s13 ;
                end
            end

            s34:begin
                if(in)
                begin
                    out = 0;
                    state = s10 ; 
                end
                else
                begin
                    out = 4;
                    state = s14 ;
                end
            end



        endcase

    end


end


endmodule


module mealy_lsb_tb();
reg clk, reset;
wire [2:0] out ;
reg drive ; 

mealy_mod5_lsb mealy2(.clk(clk), .reset(reset), .in(drive), .out(out)) ;


initial begin
        $dumpfile("mealy_mod5_lsb.vcd");
        $dumpvars(0,mealy_lsb_tb);
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
                    #10;    // input read = 011011(27) mod 5 = 2(010) ;
        reset = 1;          //reset = 1 ,output goes to 0
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
                    #10;        //input read = 11111(31) mod 5 = 1(001) ; 
        reset = 1;              //reset = 1 ,output goes to 0 again
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
        drive = 1;              //input read = 1101011010 mod 5 = 3(011) ;

        //finished reading input
        $finish;    
    end
        always #5 clk = ~clk;
    initial    
        $monitor($time,"ms Mealy_LSB reset=%b, input=%b, output=%b",reset, drive, out);

endmodule
