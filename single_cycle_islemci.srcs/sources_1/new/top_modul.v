`timescale 1ns / 1ps

module islemci_top(
    input clk,
    input reset
);

    
    wire [31:0] pc_out;
    wire [31:0] instr;
    wire [31:0] rd1, rd2, imm_ext, alu_b_girisi, alu_sonuc, ram_oku_verisi, rf_wd_girisi;
    
    
    wire alu_src_kablo, yazmac_yaz_kablo, bellek_oku_kablo, bellek_yaz_kablo, sonuc_kaynagi_kablo;
    wire [2:0] alu_sel_kablo;

   
    reg [31:0] pc_current;
    always @(posedge clk or posedge reset) begin
        if (reset) pc_current <= 32'd0;
        else       pc_current <= pc_current + 32'd4;
    end
    assign pc_out = pc_current;

    
   
    instruction_memory im_unitesi (
        .addr(pc_out >> 2),
        .instr(instr)
    );

    
    denetim_birimi beyin (
        .opcode(instr[6:0]),
        .funct3(instr[14:12]),  
    .funct7_bit30(instr[30]),   
        .alu_kaynak(alu_src_kablo),
        .yazmac_yaz(yazmac_yaz_kablo),
        .bellek_oku(bellek_oku_kablo),
        .bellek_yaz(bellek_yaz_kablo),
        .alu_islem(alu_sel_kablo),
        .sonuc_kaynagi(sonuc_kaynagi_kablo)
    );

    
    assign alu_b_girisi = (alu_src_kablo) ? imm_ext : rd2;
    
    
    assign rf_wd_girisi = (sonuc_kaynagi_kablo) ? ram_oku_verisi : alu_sonuc;

    
    register_file regi(
    .clk(clk),            
    .we(yazmac_yaz_kablo),
    .kr1(instr[19:15]),    
    .kr2(instr[24:20]),    
    .hr(instr[11:7]),     
    .wd(rf_wd_girisi),    
    .hr1(rd1),            
    .hr2(rd2)
    
    );
      alu alu_top(
      .a(rd1),
      .b(alu_b_girisi),
      .alu_sel(alu_sel_kablo),
      .sonuc(alu_sonuc),
      .zero()
      );
      genisletici genisletici_top(
      .instr(instr),
      .imm_ext(imm_ext)
      );
      veri_bellegi veri_bellegi_top(    
     .clk(clk),
     .adres(alu_sonuc),
     .yaz_verisi(rd2),
     .bellege_yaz(bellege_yaz_kablo),
    . bellege_oku(bellege_oku_kablo),
     .oku_verisi(ram_oku_verisi)
     );
      
      
      
   
    
endmodule