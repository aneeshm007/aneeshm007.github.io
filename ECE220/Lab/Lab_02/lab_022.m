fs = 14400;
Ts = 1/fs;
f0 = 440;
t = 0:Ts:1;
x_0 = cos(2*pi*f0*t);
figure
plot(t(1:200),x_0(1:200))
xlabel('time')
ylabel('$x_0$','Interpreter','LaTex')
title('Sinusoid With Constant Frequency')

x_1 = cos(2*pi*(750*t.^2 + 4400*t));

%soundsc(x_1,fs)

x_2 = cos(2*pi*(-550*t.^2 + 4400*t)); 

t1 = t(:);  %defines a new time vector for x_3
t1(7201:end) = 0;
t2 = t(:);
t2(1:7200) = 0;

x_3 = cos(2*pi*(4400.*t1 + 1100*t1.^2) + 2*pi*((6600).*t2 - 1100*t2.^2));



% Quadratic
x_4 = cos(2*pi*(4400*t + 1100*t.^3/3));




figure

spectrogram(x_1, 256,158,256,fs)
title('Linearly Increasing Frequency')


figure
spectrogram(x_2, 256,158,256,fs)
title('Linearly Decreasing Frequency')

figure
spectrogram(x_3, 256,158,256,fs)
title('Triangular Frequency')

figure
spectrogram(x_4, 256,158,256,fs)
title('Quadratically Increasing Frequency')








