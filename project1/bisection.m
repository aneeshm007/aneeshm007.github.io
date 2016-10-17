function r = bisection(f,a,b,TOL)
 
if sign(f(a)) == 0 ,
    r = a;
    return
end
 
if sign(f(b)) == 0 ,
    r = b;
    return 
end
 
 
if sign(f(a)) == sign(f(b)),
error('No Root Between Values')
end
 
 
err = abs(a-b)/2;
 
 
while err > TOL
    c = (a+b)/2;
    if sign(f(c)) == 0
        r = c;
    
    elseif sign(f(c)) == sign(f(a));
        a=c;
    else
        b=c;
    end
    err=err/2;
end
r = (a+b)/2;
end
