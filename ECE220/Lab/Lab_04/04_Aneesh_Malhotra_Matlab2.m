%3 Amplitude Limiting Effects in LTI Systems
f0 = 44100;
t = linspace(0,1.48607709750567,2^16);
x = cos(2*pi*440*t);
plot(t(1:400),x(1:400),'-b'); hold on ;
y = x;
y(y>0.8) = 0.8;
y(-y >0.8) = -0.8;
plot(t(1:400),y(1:400),'--r'); hold off;
title('Clipped Waveform','Interpreter','LaTex','fontsize',12)
xlabel('$t$','Interpreter','LaTex','fontsize',12)
ylabel('$x(t)$','Interpreter','LaTex','fontsize',12)
grid

%soundsc(x,f0) %x(t) sound
%soundsc(y,f0) %y(t) sound (more like a trumpet
%If we do not input a specified frequency, matlab uses its own Fs
%This makes the sound longer


fs = 44100; % Sampling frequencys
fc = 440;
dt = 1/fs;
L  = 2^(16);
t  = [0:L-1];
x  = sin(2*pi*fc/fs*t);
y = x;
y(y>0.8) = 0.8;
y(-y >0.8) = -0.8;
Fx = 20*log10(abs(fft(x,L))); % Spectrum of signal x
Fy = 20*log10(abs(fft(y,L)));
ff = fs*linspace(0,1,L); % Frequency values
figure
plot(ff,Fx); hold on
plot(ff,Fy); hold off;
xlim([0 3000]) % Limits frequencies to 0 -> 3,000 Hz.
xlabel('$\omega$','Interpreter','LaTex','fontsize',12)
ylabel('Amplitude','Interpreter','LaTex','fontsize',12)
title('Spectrum of $x(t)$ and $y(t)$','Interpreter','LaTex','fontsize',12)
grid
%Lowest noticeable clipping value found was 0.5

%4 Clipped Trumpet Signals
clear
load('trump_short.mat');
%soundsc(trumpet,fs);
L = 2^16;
Fx = 20*log10(abs(fft(trumpet,L)));
ff = fs*linspace(0,1,L);
figure
y = trumpet;
y(y>0.5) = 0.5;
y(-y >0.5) =-0.5;
Fy = 20*log10(abs(fft(y,L)));
plot(ff(ff<3000),Fx(ff<3000)); hold on
plot(ff(ff<3000), Fy(ff<3000)); hold off
xlabel('$\omega$','Interpreter','LaTex','fontsize',12)
ylabel('Amplitude','Interpreter','LaTex','fontsize',12)
title('Spectrum of Trumpet Signal','Interpreter','LaTex','fontsize',12)
%sound the same
% Clipped Music Signal

clear

load('River_220.mat')
L=length(y);
%soundsc(y,fs) 
Fy = 20*log10(abs(fft(y)));
ff = fs*linspace(0,1,L);
h = y;
h(h>0.5) = 0.5;
h(-h>0.5) = -0.5;
Fh = 20*log10(abs(fft(h)));
plot(ff(ff<3000),Fy(ff<3000)); hold on;
plot(ff(ff<3000),Fh(ff<3000)); hold off;

xlabel('$\omega$','Interpreter','LaTex','fontsize',12)
ylabel('Amplitude','Interpreter','LaTex','fontsize',12)
title('Spectrum of Music Signal','Interpreter','LaTex','fontsize',12)






