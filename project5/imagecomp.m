% compresses 8x8 image to a black and white image

function Xc = imagecomp(X, Q)


C = dct(X);

Y = quant(X,C,Q);

Xc = dequant(Y,C,Q);




