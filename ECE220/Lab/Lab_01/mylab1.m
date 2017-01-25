tt = -1 : 0.01 : 1;
xx = cos( 5*pi*tt );
zz = 1.4*exp(j*pi/2)*exp(j*5*pi*tt);
plot(tt,xx,'b-',tt,real(zz),'r--' ),  %plot a sinusoid
grid on
title('TEST PLOT of a SINUSOID')
xlabel('TIME (sec)')

%The plot of zz is a sinusoid because we only plotted the real part
% Seems that the phase is 0.1