function s = MultiVarNewt(x_0, n,t)

for i = 1 : n
    v = DH(x_0,t) \ -H(x_0,t);
    x_1 = x_0 + v;
    x_0 = x_1;
end

s = x_0;
    
    
