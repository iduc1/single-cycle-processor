`timescale 1ns / 1ps

module genisletici(
    input [31:0] instr,          
    output reg [31:0] imm_ext    
);

    always @(*) begin
        
    imm_ext = { {20{instr[31]}}, instr[31:20] };
    
    
    
    end

endmodule