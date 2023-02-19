module TLPSFSM(inp,clk,out,rst,out_buzz);
input clk,rst;
input inp;
reg [3:0]state;
output reg out;
output reg out_buzz;
integer count=0;
always @(posedge clk or posedge rst)
begin
  if(rst)
    begin
      state <=4'b0000;
      out<=0;
    end
  else
    begin
      case(state)
        //A
        4'b0000:
          begin
            if(~inp) begin 
              state<=4'b0001;
              out<=0;
            end
            else
            begin
              state<=4'b0000;
              count=count+1;
            end
          end
        //B
        4'b0001:
          begin
            if(~inp) begin 
              state<=4'b0010;
              out<=0;
            end
            else
            begin
              state<=4'b0000;
              count=count+1;
            end
          end
        //C
        4'b0010:
          begin
            if(~inp) begin 
              state<=4'b0011;
              out<=0;
            end
            else
            begin
              state<=4'b0000;
              count=count+1;
            end

          end
        //D
        4'b0011:
          begin
            if(inp) begin 
              state<=4'b0100;
              out<=0;
            end
                        else
            begin
              state<=4'b0000;
              count=count+1;
            end

          end
        //E
        4'b0100:
          begin
            if(~inp) begin 
              state<=4'b0101;
              out<=0;
            end
                        else
            begin
              state<=4'b0000;
              count=count+1;
            end

          end
        //F
        4'b0101:
          begin
            if(inp) begin 
              state<=4'b0110;
              out<=0;
            end
                        else
            begin
              state<=4'b0000;
              count=count+1;
            end

          end
        //G
        4'b0110:
          begin
            if(inp) begin 
              state<=4'b0111;
              out<=0;
            end
                        else
            begin
              state<=4'b0000;
              count=count+1;
            end

          end
        //H
        4'b0111:
          begin
            if(inp) begin
              state<=4'b1000;
              out<=0;
            end
                       else
            begin
              state<=4'b0000;
              count=count+1;
            end

          end
        //I
        4'b1000:
          begin
            if(~inp) begin 
              state<=4'b1001;
              out<=0;
            end
                       else
            begin
              state<=4'b0000;
              count=count+1;
            end

          end
        //J
        4'b1001:
          begin
            if(~inp) begin 
              state<=4'b1010;
              out<=0;
            end
            else
            begin
              state<=4'b0000;
              count=count+1;
            end
          end
        //K
        4'b1010:
          begin
            if(inp) begin 
              state<=4'b1011;
              out<=0;
            end
                        else
            begin
              state<=4'b0000;
              count=count+1;
            end

          end
        //L
        4'b1011:
          begin
            if(inp) begin
              state<=4'b1100;
              out<=0;
            end
                        else
            begin
              state<=4'b0000;
              count=count+1;
            end

          end
        //M
        4'b1100:
          begin
            if(~inp)begin 
              state<=4'b1101;
              out<=0;
            end
                        else
            begin
              state<=4'b0000;
              count=count+1;
            end

          end
        //N
        4'b1101:
          begin
            if(~inp) begin 
              state<=4'b1110;
              out<=0;
            end
                        else
            begin
              state<=4'b0000;
              count=count+1;
            end

          end
        //O
        4'b1110:
          begin
            if(inp) begin 
              state<=4'b1111;
              out<=0;
            end
                       else
            begin
              state<=4'b0000;
              count=count+1;
            end

          end
        //P
        4'b1111:
          begin
            if(~inp) begin
               state<=4'b0000;
               out<=1;
            end
                        else
            begin
              state<=4'b0000;
              count=count+1;
            end

          end
      endcase

        
    end
	
end
always @(*)
begin
if(count==3)
out_buzz<=1;
else
out_buzz<=0;
end
endmodule

