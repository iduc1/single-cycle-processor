`timescale 1ns / 1ps

module islemci_tb();

  
    reg clk;
    reg reset;

  
    islemci_top uut (
        .clk(clk),
        .reset(reset)
    );

   
    always begin
        #5 clk = ~clk; 
    end

    
    initial begin
        
        clk = 0;
        reset = 1;

        
        #20;
        reset = 0;

        
        #200;
        
       
        $display("Simulasyon tamamlandi. Dalga formlarini (Waveform) inceleyin.");
        $stop;
    end

endmodule