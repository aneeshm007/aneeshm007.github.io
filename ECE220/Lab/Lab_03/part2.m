%Part 2 
b= [2];
a = [1,3];
SYS = tf(b,a);
step(SYS)
[h,t1] = impulse(SYS);
x = exp(-5*t1);
out = conv(x,h); % using convolution
plot(t1,downsample(out,2)); 
figure

%Analytic Step
anyl_step= @(t) (2/3) - (2/3)*exp(-3*t);
plot(t1,anyl(t1))
title('hello')

%Analytic Impulse
anyl_impulse = -2*exp(-3*t1)

t = 0:0.01:10;
x = ones(1,length(t));
figure
lsim(SYS,x,t);
y1 = lsim(SYS,x,t);

%b output for delayed step

x(t<4) = 0; % For all indices for which t is less than 4, x is zero.
y2 = lsim(SYS,x,t); %We have a delayed step response

%exponential input 

x = ones(1,length(t));
t = 0:0.01:10;

x = x.* exp(-5*t);
y3 = lsim(SYS,x,t);

%New System

SYS2 = tf([1 1],[1 0.4 0.2]);

y3 = step(SYS2);
y4 = impulse(SYS2);
freqs([1 1],[1 0.4 0.2])



