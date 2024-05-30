// sum
module sum (s_o,x_i,y_i,c_i);
    input x_i,y_i,c_i;
    output s_o;
    assign s_o = x_i ^ y_i ^ c_i;
endmodule 


// carry
module carry (c_o,x_i,y_i,c_i);
    input x_i,y_i,c_i;
    output c_o;
    assign c_o = (x_i&y_i) |  (y_i&c_i) | (c_i&x_i);
endmodule 


/// 1 bit add
module add_1 (c_o,s_o,x_i,y_i,c_i);
    input x_i,y_i,c_i;
    output c_o, s_o;
    sum g1(s_o,x_i,y_i,c_i);
    carry g2(c_o,x_i,y_i,c_i);
endmodule 



// 4 bit add
module add_4 (c_o,s_o,x_i,y_i,c_i);
    input [3:0] x_i,y_i;
    input c_i;
    output [3:0] s_o;
    output c_o;
    wire [2:0] c_out;
    add_1 g1(c_out[0],s_o[0],x_i[0],y_i[0],c_i);
    add_1 g2(c_out[1],s_o[1],x_i[1],y_i[1],c_out[0]);
    add_1 g3(c_out[2],s_o[2],x_i[2],y_i[2],c_out[1]);
    add_1 g4(c_o,s_o[3],x_i[3],y_i[3],c_out[2]);
endmodule