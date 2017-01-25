%Part 2: Design of a Low-Shelf Filter
[lnum1, lden1] = design_shelf(10, 2*pi*300,0);
Hls1 = tf(lnum1,lden1);
figure
pzplot(Hls1)
title('Poles and Zeros of a Low-Shelf Filter with $g = 10$','Interpreter','LaTex')

[lnum2, lden2] = design_shelf(0.1, 2*pi*300,0);
Hls2 = tf(lnum2,lden2);
figure
pzplot(Hls2)
title('Poles and Zeros of a Low-Shelf Filter with $g = 0.1$','Interpreter','LaTex')

w = linspace(0,10000,100000);

[A1,B1] = freqs(lnum1,lden1,w);
[A2,B2] = freqs(lnum2,lden2,w);

figure
subplot(2,1,1)
plot(B1,20*log10(abs(A1)))
title('$|H(j\omega)|$ for a Low-Shelf Filter with $g=10$','Interpreter','LaTex')

subplot(2,1,2)
plot(B2,20*log10(abs(A2)))
title('$|H(j\omega)|$ for a Low-Shelf Filter with $g=.1$','Interpreter','LaTex')

%Part 2 High Shelf Filter

[lnum3, lden3] = design_shelf(10,2*pi*300,1);
Hhs1 = tf(lnum3,lden3);
figure
pzplot(Hhs1)
title('Poles and Zeros of a High-Shelf Filter with $g = 10$','Interpreter','LaTex')

[lnum4, lden4] = design_shelf(0.1, 2*pi*300,1);
Hhs2 = tf(lnum4,lden4);
figure
pzplot(Hhs2)
title('Poles and Zeros of a High-Shelf Filter with $g = 0.1$','Interpreter','LaTex')


[A3,B3] = freqs(lnum3,lden3,w);
[A4,B4] = freqs(lnum4,lden4,w);

figure
subplot(2,1,1)
plot(B3,20*log10(abs(A3)))
title('$|H(j\omega)|$ for a High-Shelf Filter with $g=10$','Interpreter','LaTex')

subplot(2,1,2)
plot(B4,20*log10(abs(A4)))
title('$|H(j\omega)|$ for a High-Shelf Filter with $g=.1$','Interpreter','LaTex')

%Part 2d

t1 = linspace(0,(1/3),10000);
x1 = cos(2*pi*30*t1);

t2 = linspace(0,(10/300),10000);
x2 = cos(2*pi*300*t2);

t3 = linspace(0,(10/3000),10000);
x3 = cos(2*pi*3000*t3);

y11 = lsim(Hls1,x1,t1);
y21 = lsim(Hls1,x2,t2);
y31 = lsim(Hls1,x3,t3);

y12 = lsim(Hls2,x1,t1);
y22 = lsim(Hls2,x2,t2);
y32 = lsim(Hls2,x3,t3);

figure
subplot(3,2,1)
plot(t1,y11)
title('Low Shelf $f = 30$, $g=10$','Interpreter','LaTex')

subplot(3,2,3)
plot(t2,y21)
title('Low Shelf $f = 30$,$g=10$','Interpreter','LaTex')

subplot(3,2,5)
plot(t3,y31)
title('Low Shelf $f = 30$, $g=10$','Interpreter','LaTex')

subplot(3,2,2)
plot(t1,y12)
title('Low Shelf $f = 30$, $g=0.1$','Interpreter','LaTex')

subplot(3,2,4)
plot(t2,y22)
title('Low Shelf$f = 30$, $g=0.1$','Interpreter','LaTex')

subplot(3,2,6)
plot(t3,y32)
title('Low Shelf $f = 30$, $g=0.1$','Interpreter','LaTex')

u11 = lsim(Hhs1,x1,t1);
u21 = lsim(Hhs1,x2,t2);
u31 = lsim(Hhs1,x3,t3);

u12 = lsim(Hhs2,x1,t1);
u22 = lsim(Hhs2,x2,t2);
u32 = lsim(Hhs2,x3,t3);

figure
subplot(3,2,1)
plot(t1,u11)
title('High Shelf $f = 30$, $g=10$','Interpreter','LaTex')

subplot(3,2,3)
plot(t2,u21)
title('High Shelf $f = 30$,$g=10$','Interpreter','LaTex')

subplot(3,2,5)
plot(t3,u31)
title('High Shelf $f = 30$, $g=10$','Interpreter','LaTex')

subplot(3,2,2)
plot(t1,u12)
title('High Shelf $f = 30$, $g=0.1$','Interpreter','LaTex')

subplot(3,2,4)
plot(t2,u22)
title('High Shelf $f = 30$, $g=0.1$','Interpreter','LaTex')

subplot(3,2,6)
plot(t3,u32)
title('High Shelf $f = 30$, $g=0.1$','Interpreter','LaTex')

%Part 4: Music Equalization

%a
%The sound of the two is combined. The bass is slightly 
%dominant in the mixture

%To improve mixture, I would attenuate the bass by using a high shelf

load('lab6.mat')
figure
win = 512; noverlap = 256; nfft = 512;
spectrogram(mixture2, win, noverlap, nfft, fs, 'yaxis');
colorbar
title('Spectrogram of a Bass-Piano Mixture','Interpreter','LaTex')

%bass is approximately 250 Hz

[num, den] = design_shelf(0.4,2*pi*400,0);


hls = tf(num,den); 

maxt = length(mixture2)/fs;
tmix = linspace(0,maxt,92834);
tmix = tmix';

Y = lsim(hls,mixture2,tmix);

figure
spectrogram(Y, win, noverlap, nfft, fs, 'yaxis');
title('Spectrogram of Filtered Mixture','Interpreter','LaTex')

%soundsc(Y,fs)
%This sounds better

%Last Part
%I will use a low shelf and high shelf filter.

[r1, r2] = design_shelf(0.0001,2*pi*330,0);
shelf1 = tf(r1,r2);
[s1,s2] = design_shelf(100,2*pi*380,1);
shelf2=tf(s1,s2);
%This is a C-major chord. I will attenuate the C and E frequencies


tmus = linspace(0,4,40000);

Y1 = lsim(shelf1,music,tmus);
Y2 = lsim(shelf2,Y1,tmus); 
soundsc(Y2,fs)

figure
subplot(2,1,1)
spectrogram(music, win, noverlap, nfft, fs, 'yaxis');
title('Spectrogram of a Music Signal','Interpreter','LaTex')
subplot(2,1,2)
spectrogram(Y2, win, noverlap, nfft, fs, 'yaxis');
title('Spectrogram of a Filtered Music Signal','Interpreter','LaTex')