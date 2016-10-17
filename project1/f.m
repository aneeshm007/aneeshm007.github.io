function out = f(theta)
L1 = 2;
L2 = sqrt(2);
L3 = sqrt(2);
gam = (pi/2);
p1=sqrt(5);
p2=sqrt(5);
p3=sqrt(5);
x1 = 4;
x2=0;
y2 = 4;
A2 = L3*cos(theta) - x1;
B2 = L3*sin(theta);
A3 = L2*cos(theta + gam) - x2;
B3 = L2*sin(theta + gam) - y2;

N1 = B3.*(p2.^2 - p1.^2 - A2.^2 - B2.^2) - B2.*(p3.^2 - p1.^2 - A3.^2 - B3.^2);

D = 2.*(A2.*B3-B2.*A3);

N2 = -A3.*(p2.^2 - p1.^2 - A2.^2 - B2.^2) + A2.*(p3.^2 - p1.^2 - A3.^2 - B3.^2);

x = N1./D;
y = N2./D;

out = N1.^2 + N2.^2 - (p1*D).^2;
end



