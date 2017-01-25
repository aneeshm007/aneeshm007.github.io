%Prelab4
a = [1 0.4 1];
b = [0.2 0.3 1];
poles=roots(a);
zeros = roots(b);
H = tf(b,a);
pzmap(H);
grid
%e Analytical Expression for H(s)
H = @(w) (-0.2*w.^2 + 0.3*j*w + 1)./(-w.^2 + 0.4*j*w+1);
s = linspace(0,5,101);
figure
%plot(s,abs(H(s)))
plot(s,20*log10(abs(H(s))));
grid
title('Analytical Frequency Response','Interpreter','LaTex','fontsize',12)
xlabel('$\omega$','Interpreter','LaTex','fontsize',12)
ylabel('$|H(\omega)|$','Interpreter','LaTex','fontsize',12)

%Frequency Response of LTI Systems
a = [1.0 0.4 1.0];
b = [0.2 0.3 1.0];
w = linspace(0,5,101);
H = freqs(b,a,w);
figure
plot(w,20*log10(abs(H)))
title('Frequency Response Using Freqs','Interpreter','LaTex')
xlabel('Frequency (rad/s)','Interpreter','LaTex')
ylabel('$|H(j\omega)|$ in dB','Interpreter','LaTex')
grid
%We obtained the same results as in question 1

%b

w0 = 2*pi*60;
theta0 = pi/3;

num0 = [1, 0, w0^2];
den0 = [1, 2*w0*cos(theta0), w0^2];
freqs(num0,den0);


%frequencies around w0 are attenuated because w0 is a zero

theta1 = pi/2;

den1 = [1, 2*w0*cos(theta1), w0^2];
figure
%freqs(num0,den1)
%No frequencies attenuated because num is a factor of den













