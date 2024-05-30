module add_4_tb;

    reg [3:0]x;
    reg [3:0]y;
    reg ci;
    wire co;
    wire [3:0]s;

    add_4 u0_DUT
    (
        .x_i(x),
        .y_i(y),
        .c_o(co),
        .s_o(s),
        .c_i(ci)
    );


    initial begin
        $dumpfile("add_4_wave.vcd");
        $dumpvars(0,add_4_tb);
        #0 x  = 4'b0101; 
        #0 y  = 4'b0111;
        #0 ci = 4'b0000;
        #1 x  = 4'b1101; 
        #1 y  = 4'b0111;
        #1 ci = 4'b0000;
        #2 x  = 4'b1101; 
        #2 y  = 4'b0110;
        #2 ci = 4'b0000;
        #4 $finish;
    end

endmodule