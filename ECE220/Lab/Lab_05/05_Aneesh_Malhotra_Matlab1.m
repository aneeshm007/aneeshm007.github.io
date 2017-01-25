Tp = 330;
np = 100;
N = 33000;
p_3 = [ones(1,220), -1*ones(1,110)];
xlabel('time (s)','Interpreter','latex')
h_MF3 = [-1*ones(1,110), ones(1,220)];
out3 = conv(h_MF3,p_3); %Expect 330*2 -1 points
%Max occurs at 330 since largest overlap

subplot(2,1,1)
plot(p_3) %max still occurs at 330
xlabel('time (s)','Interpreter','latex')
ylabel('Output','Interpreter','latex')
title('Pulse $p_3(t)$','Interpreter','latex')
subplot(2,1,2)
plot(h_MF3) %max still occurs at 330
xlabel('time (s)','Interpreter','latex')
ylabel('Output','Interpreter','latex')
title('Matched Filter for $p_3(t)$','Interpreter','latex')


figure
plot(out3) %max still occurs at 330
xlabel('time (s)','Interpreter','latex')
ylabel('Output','Interpreter','latex')
title('Matched Filter Response of 3 Digit Barker Code','Interpreter','latex')


p_11 = [];
code11 = [1 1 1 -1 -1 -1 1 -1 -1 1 -1];
for i = 1:length(code11)
    p_11 = [p_11, ones(1,30)*code11(i)];
end
h_MF11 = fliplr(p_11);
out11 = conv(h_MF11,p_11);

subplot(2,1,1)
plot(p_11) %max still occurs at 330
xlabel('time (s)','Interpreter','latex')
ylabel('Output','Interpreter','latex')
title('Pulse $p_{11}(t)$','Interpreter','latex')
subplot(2,1,2)
plot(h_MF11) %max still occurs at 330
xlabel('time (s)','Interpreter','latex')
ylabel('Output','Interpreter','latex')
title('Matched Filter for $p_{11}(t)$','Interpreter','latex')

figure
plot(out11) %max still occurs at 330
xlabel('time (s)','Interpreter','latex')
ylabel('Output','Interpreter','latex')
title('Matched Filter Response of 11 Digit Barker Code','Interpreter','latex')
 


%Section 2: Binary Data Encoding Systems
 
 N = 100;
 fs = 330;
 samples = 33000;
  
 %SIG = sign(randn(1,100)); 
 
load('SIG_Values.mat') %loads random values
 
 s_3 = [];
 s_11 = [];
 
 figure
 stem(SIG(1:4))
 title('First Four Bits of Noise Signal','Interpreter','latex')
 ylim([-1.5,1.5])
 for i = 1:length(SIG)
     s_3 = [s_3 p_3*SIG(i)];   %first 4 has 330*4 samples 
     s_11 = [s_11 p_11*SIG(i)];
 end
 figure
 plot(s_3(1:4*330));
 ylim([-1.5,1.5])
 xlabel('time (s)','Interpreter','latex')
 title('First Four Bits of $s_{3}(t)$','Interpreter','latex')
 ylabel('Output','Interpreter','latex')

 figure
 plot(s_11(1:(4*330)))
 xlabel('time (s)','Interpreter','latex')
 ylim([-1.5,1.5])
 ylabel('Output','Interpreter','latex')
 title('First Four Bits of $s_{11}(t)$','Interpreter','latex')
 %Section 3:
 
 nse = randn(1,33000);
 x_1 = s_3 + nse; 
 x_3 = s_3 + 2*nse; % Adding Noise to s_3
 x_5 = s_3 + 5*nse;

 y_1 = conv(h_MF3,x_1); %correct matched filter
 y_3 = conv(h_MF3,x_3); 
 y_5 = conv(h_MF3,x_5);

 y_e1 = conv(h_MF11,x_1); % wrong matched filter cases
 y_e3 = conv(h_MF11,x_3);
 y_e5 = conv(h_MF11,x_5);
 
 
 f_1 = s_11 + nse;
 f_3 = s_11 + 3*nse; %Adding Noise to s_11
 f_5 = s_11 + 5*nse;
 
 g_1 = conv(h_MF11,f_1);
 g_3 = conv(h_MF11,f_3); %Correct Matched Filter
 g_5 = conv(h_MF11,f_5);
 
 g_e1 = conv(h_MF3,f_1);
 g_e3 = conv(h_MF3,f_1); %Incorrect Matched Filter
 g_e5 = conv(h_MF3,f_1);
 
 
 %Plotting
 
figure 
subplot(3,1,1)
plot(x_1) %max still occurs at 330
xlabel('time (s)','Interpreter','latex')
ylabel('Output','Interpreter','latex')
title('$s_3(t) + nse$','Interpreter','latex')
subplot(3,1,2)
plot(x_3) %max still occurs at 330
xlabel('time (s)','Interpreter','latex')
ylabel('Output','Interpreter','latex')
title('$s_3(t) + 3nse$','Interpreter','latex')
subplot(3,1,3)
plot(x_5)
xlabel('time (s)','Interpreter','latex')
ylabel('Output','Interpreter','latex')
title('$s_3(t) + 5nse$','Interpreter','latex')

figure
subplot(3,1,1)
plot(y_1) %max still occurs at 330
xlabel('time (s)','Interpreter','latex')
ylabel('Output','Interpreter','latex')
title('Convolution of $h_{MF3}$ with $s_3(t) + nse$','Interpreter','latex')
subplot(3,1,2)
plot(y_3) %max still occurs at 330
xlabel('time (s)','Interpreter','latex')
ylabel('Output','Interpreter','latex')
title('Convolution of $h_{MF3}$ with $s_3(t) + 3nse$','Interpreter','latex')
subplot(3,1,3)
plot(y_5)
xlabel('time (s)','Interpreter','latex')
ylabel('Output','Interpreter','latex')
title('Convolution of $h_{MF3}$ with $s_3(t) + 5nse$','Interpreter','latex')
 
figure
subplot(3,1,1)
plot(y_e1) %max still occurs at 330
xlabel('time (s)','Interpreter','latex')
ylabel('Output','Interpreter','latex')
title('Convolution of $h_{MF11}$ with $s_3(t) + nse$','Interpreter','latex')
subplot(3,1,2)
plot(y_e3) %max still occurs at 330
xlabel('time (s)','Interpreter','latex')
ylabel('Output','Interpreter','latex')
title('Convolution of $h_{MF11}$ with $s_3(t) + 3nse$','Interpreter','latex')
subplot(3,1,3)
plot(y_e5)
xlabel('time (s)','Interpreter','latex')
ylabel('Output','Interpreter','latex')
title('Convolution of $h_{MF11}$ with $s_3(t) +5nse$','Interpreter','latex')
 

figure 
subplot(3,1,1)
plot(f_1) %max still occurs at 330
xlabel('time (s)','Interpreter','latex')
ylabel('Output','Interpreter','latex')
title('$s_{11}(t) + nse$','Interpreter','latex')
subplot(3,1,2)
plot(f_3) %max still occurs at 330
xlabel('time (s)','Interpreter','latex')
ylabel('Output','Interpreter','latex')
title('$s_{11}(t) + 3nse$','Interpreter','latex')
subplot(3,1,3)
plot(f_5)
xlabel('time (s)','Interpreter','latex')
ylabel('Output','Interpreter','latex')
title('$s_{11}(t) + 5nse$','Interpreter','latex')

figure
subplot(3,1,1)
plot(g_1) %max still occurs at 330
xlabel('time (s)','Interpreter','latex')
ylabel('Output','Interpreter','latex')
title('Convolution of $h_{MF11}$ with $s_{11}(t) + nse$','Interpreter','latex')
subplot(3,1,2)
plot(g_3) %max still occurs at 330
xlabel('time (s)','Interpreter','latex')
ylabel('Output','Interpreter','latex')
title('Convolution of $h_{MF11}$ with $s_{11}(t) + 3nse$','Interpreter','latex')
subplot(3,1,3)
plot(g_5)
xlabel('time (s)','Interpreter','latex')
ylabel('Output','Interpreter','latex')
title('Convolution of $h_{MF11}$ with $s_{11}(t) + 5nse$','Interpreter','latex')
 

figure
subplot(3,1,1)
plot(g_e1) %max still occurs at 330
xlabel('time (s)','Interpreter','latex')
ylabel('Output','Interpreter','latex')
title('Convolution of $h_{MF3}$ with $s_{11}(t) + nse$','Interpreter','latex')
subplot(3,1,2)
plot(g_e3) %max still occurs at 330
xlabel('time (s)','Interpreter','latex')
ylabel('Output','Interpreter','latex')
title('Convolution of $h_{MF3}$ with $s_{11}(t) + 3nse$','Interpreter','latex')
subplot(3,1,3)
plot(g_e5)
xlabel('time (s)','Interpreter','latex')
ylabel('Output','Interpreter','latex')
title('Convolution of $h_{MF3}$ with $s_{11}(t) +5nse$','Interpreter','latex')

 