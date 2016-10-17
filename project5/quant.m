function Y = quant(X,C,Q)
X=double(X);
X = X - 128;
Y = C*X*C';
Y = round(Y./Q);
