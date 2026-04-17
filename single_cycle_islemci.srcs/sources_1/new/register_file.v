`timescale 1ns / 1ps


module register_file(
input clk,
input we,
input [4:0]kr1,
input [4:0]kr2,
input[4:0]hr,
input [31:0]wd,
output [31:0]hr1,
output [31:0]hr2

    );
    reg [31:0] rf [0:31];
    integer j;
initial begin
    for (j = 0; j < 32; j = j + 1) rf[j] = 32'h0;
end
    assign hr1 = (kr1 == 5'd0) ? 32'd0 : rf[kr1];
    assign hr2 = (kr2 == 5'd0) ? 32'd0 : rf[kr2];
    
    always@(posedge clk)begin
    if(hr != 5'd0 && we == 1'd1)begin
     rf[hr]<=wd;
    end
    end
endmodule
