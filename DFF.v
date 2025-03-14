`timescale 1ns/1ns

module DFF(D, S, R, clk, Q, Qb);
    input D, S, R, clk;
    output Q, Qb;

    wire Db, cb, w1, w2, w3, w4, w5, w6;

    not #1n1(cb, clk);
    not #1n2(Db, D);
    nand #1na1(w1, D, cb);
    nand #1na2(w2, Db, cb);
    nand #1na3(w3, S, w1, w4);
    nand #1na4(w4, R, w2, w3);
    nand #1na5(w5, w3, clk);
    nand #1na6(w6, w4, clk);
    nand #1na7(Q, S, w5, Qb);
    nand #1na8(Qb, R, w6, Q);
endmodule