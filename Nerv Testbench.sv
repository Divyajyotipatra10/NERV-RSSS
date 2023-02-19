module test();
  reg [15:0]data_in;
  reg reset,rd,wr,cs,pass;
  wire [15:0]lock;
  nerv dut(.data_in(DATA_IN),.pass(PASS),.reset(RESET),.rd(READ),.wr(WRITE),.cs(CS),.lock(LOCK));
  initial begin
    $dumpfile("nerv.vcd");
    $dumpvars(0,test);
    if(pass == 0)
      begin
        wr<=1;
        rd<=0;
      end
    if(pass==1)
      begin
        rd<=0;
        wr<=1;
        #30
        wr<=0;
        rd<=1;
      end
  end
  initial begin
    	pass <=0;
        reset<=0;
        cs<=1;
        wr<=1;
        data_in<=5423;
    $display("Password is correct");
  end
    
endmodule

    
    
    
