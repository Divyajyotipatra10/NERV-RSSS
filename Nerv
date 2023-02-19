module nerv(DATA_IN,PASS,RESET,READ,WRITE,LOCK,CS);
input [15:0]DATA_IN;
input RESET,READ,WRITE,CS,PASS;
output [15:0]LOCK;
wire [15:0]x1;
wire [15:0]x2;
memory m1(RESET,CS,PASS,DATA_IN,x1,x2,READ,WRITE);
compare c1(x1,x2,LOCK);
endmodule

module memory(reset,cs,add,din,dout,dout1,rd,wr);
input reset,cs,rd,wr,add;
input [15:0] din;
output reg [15:0] dout;
output reg [15:0] dout1;
reg [15:0] memo [1:0];
always @(*)
begin
if(~reset)
begin
if(cs == 1 & wr ==1)
begin
memo[add]<=din;
end
end
if (cs==1 & rd==1)
begin
dout<=memo[0];
dout1<=memo[1];
end
end
endmodule

module compare(a,c,lock);
input [15:0]a;
input [15:0]c;
output reg [15:0]lock;
always @(*)
begin
if (a==c)
begin
lock<=16'b1;
end
else
lock<=16'b0;
end
endmodule
