xk = cos( pi * (0:11)/4)

% The different values of cosine are different multiples of ?/4 
% xk(1) is the first element of the vector and it is 1.
% xk(0) is not defined as matlab uses 1-based indexing.


% b) Loops 
%yy = [ ];       %initialize the yy vector to be empty
%for k=-5:5
%    yy(k+6) = cos( k*pi/5 )
%end yy

yy = cos(pi*(-5:5)/5)

% Using (k+6) is necessary so that you start at 1

x = [-3 -1 0 1 3 ];
y = x.*x - 3*x;
plot( x, y )
z = x + y*sqrt(-1)
plot( z )



