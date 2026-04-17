`timescale 1ns / 1ps



module alu(

input [31:0] a,
input [31:0]b,
input [2:0]alu_sel,
output reg [31:0]sonuc,
output zero




   );
   localparam topla =3'd0;
   localparam            cikar =3'd1;
   localparam            andl =3'd2;
   localparam orl=3'd3;
   localparam xorl=3'd4; 
   
   
   assign zero = (sonuc == 32'd0);
   
   
   always@(*)begin
   case(alu_sel)
   topla: sonuc=a+b;
   cikar: sonuc=a-b;           
  andl: sonuc=a&b;
  orl:sonuc=a|b;
  xorl:sonuc=a^b;
  default:sonuc=32'd0;
  endcase 
   
   end
   
   
endmodule
