module veri_bellegi(
    input clk,
    input [31:0] adres,       
    input [31:0] yaz_verisi, 
    input bellege_yaz,        
    input bellege_oku,        
    output [31:0] oku_verisi 
);
    reg [31:0] ram [0:255];   

     assign oku_verisi = (bellege_oku) ? ram[adres] : 32'd0;
    always @(posedge clk) begin
       
        if (bellege_yaz) begin
            
              ram[adres] <= yaz_verisi;
        end
         
          end

   
    
   

endmodule