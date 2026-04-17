module denetim_birimi(
    input [6:0] opcode,
    input [2:0] funct3,
    input funct7_bit30,
    
    
    output reg yazmac_yaz,
    output reg alu_kaynak,     
    output reg bellek_yaz,
    output reg bellek_oku,
    output reg [2:0] alu_islem,
    output reg sonuc_kaynagi
);

    always @(*) begin
      
        yazmac_yaz = 0; alu_kaynak = 0; bellek_yaz = 0; 
        bellek_oku = 0; alu_islem = 3'b000; sonuc_kaynagi = 0;

        case(opcode)
            7'b0110011: begin 
       yazmac_yaz = 1;
         alu_kaynak = 0;
        bellek_yaz=0;
          bellek_oku=0;
             sonuc_kaynagi=0;
                
                case(funct3)
          3'b000:begin
          if(funct7_bit30) alu_islem=3'd1;
            else alu_islem=3'd0;
            end
                3'b111: alu_islem = 3'd2; 
           3'b110: alu_islem = 3'd3; 
           default: alu_islem = 3'd0;
            endcase
            end
            
            7'b0010011: begin 
         yazmac_yaz=1;
          alu_kaynak=1;
         bellek_yaz=0;
           bellek_oku=0;
           sonuc_kaynagi=0;
            case(funct3)
            3'b000:alu_islem=3'd0;
            3'b111:alu_islem=3'd2;
            default:alu_islem=3'd0;
            endcase
            
            end
            
       7'b0000011:begin 
            yazmac_yaz=1;
            alu_kaynak=1;
            bellek_oku=1;
            sonuc_kaynagi=1;
            alu_islem=3'd0;
            end
      7'b0100011:begin
            yazmac_yaz=0;
           alu_kaynak=1;
            bellek_oku=0;
          bellek_yaz=1;
 alu_islem=3'd0;
            sonuc_kaynagi=0;
           end
            
        endcase
                   end
endmodule