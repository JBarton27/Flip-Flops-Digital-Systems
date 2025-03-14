`timescale 1ns/1ns

module fallingEdgeFF(D, S, R, clk, Q, Qb);
    input D, S, R, clk;
    output Q, Qb;

    wire di, cw, w1, w2, w3, w4, w5, w6;

    not  #1n1(di, D);
    not  #1n2(cw, clk);
    nand #1na1(w1, D, clk);
    nand #1na2(w2, di, clk);
    nand #1na3(w3, w1, w4, S);
    nand #1na4(w4, w2, w3, R);
    nand #1na5(w5, cw, w3);
    nand #1na6(w6, cw, w4);
    nand #1na7(Q, Qb, w5, S);
    nand #1na8(Qb, Q, w6, R);
endmodule