`timescale 1ns / 1ps



module instruction_memory(

input [31:0] addr,
output [31:0] instr


    );
    
    reg [31:0] mem [0:255];
   integer i;
initial begin
    for (i = 0; i < 256; i = i + 1) mem[i] = 32'h0; 
    mem[0] = 32'h00A00093; 
    mem[1] = 32'h00B00113; 
    mem[2] = 32'h002081B3; 
end
   
  assign instr = mem[addr];
  
endmodule
