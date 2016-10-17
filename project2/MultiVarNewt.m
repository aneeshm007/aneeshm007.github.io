function s = MultiVarNewt(x_0, n)

for i = 1 : n
    v = DF(x_0) \ -F(x_0);
    x_1 = x_0 + v;
    x_0 = x_1;
end

s = x_0;
    
    
