function Xc = dequant(Y,C,Q)
Xc = Y.*Q;
Xc = C'*Xc*C;
Xc = Xc + 128;