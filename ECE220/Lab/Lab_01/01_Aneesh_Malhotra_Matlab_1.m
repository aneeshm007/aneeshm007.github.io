%3.1 Plotting Sinusoids

tt = -(1/440):(1/(440*50)): 1/440; %Creates about 51 samples per period

A1 = 2*21; %Twice my age
A2 = A1*0.8; 
T = 1/440;
M = 8; % Birth Month
D = 23; % Birth Day
tm1 = -(37.2/M)*T; % Constructing the time shifts
tm2 = (41.3/D)*T;


x1 = @ (t) A1*cos(2*pi*440*(t - tm1));
x2 = @ (t) A2*cos(2*pi*440*(t - tm2)); 
x3 = x1(tt) + x2(tt); % x3 and x4 are not function handles 
x4 = x1(tt) .* x2(tt); 
[max1,I1] = max(x1(tt)); 
[max2,I2] = max(x2(tt)); 


figure
subplot(3,1,1); plot (tt,x1(tt),'.r'); hold on; plot (tt , x2 (tt),'g');
plot(tt(I1)*ones(1000,1), linspace(0, max(x1(tt)), 1000),'--m');
plot(tt(I2)*ones(1000,1), linspace(0, max(x2(tt)), 1000),'--m');
hold off 
title('x(t) vs t Aneesh Malhotra')
xlabel('time (s)');
ylabel('x(t)');
subplot(3,1,2); plot (tt,x3); 
title('x(t) vs t')
xlabel('time (s)'); % This block of code does the subplots
ylabel('x(t)');
subplot(3,1,3); plot (tt,x4);
title('x(t) vs t')
xlabel('time (s)');
ylabel('x(t)');

%Part 3.3

X = 2.0;
w = 2*pi*440; % period of this waveform is (1/440)
t = linspace(-1/440,  1/440, 100);
x1 = real(X*exp(j*w*t)); 


% 3.4: Harmonics (function defined in separate file)

w0 = 2*pi*440;
Tsample = 1/(50*440); % defines 50 samples per period
Cn = [0 1];
thetan = [0 0];
tmax = 100/440; 


[t,r1] = harmonics(w0,Cn,thetan,tmax,Tsample);
figure
plot(t,r1)
%soundsc(r1,1/Tsample) % Comment this line to listen to other sounds
plot(t(1:201),r1(1:201)); % Index 201 is where t = 4/440 (4 periods)
xlabel('time (s)')
ylabel('r1(t)')
title('r1(t) vs t') 
clear w0 Tsample Cn thetan

load paramFall2016.mat % Loads new variables

figure 

tmax = 100/440; 
[t,r2] = harmonics(w0,Cn,thetan,tmax,Tsample);
soundsc(r2,1/Tsample) % Ran this separately as Matlab attempts to play
                        % this and r1 simultaenously
plot(t(1:201),r2(1:201));
xlabel('time (s)')
ylabel('r2(t)')
title('r2(t) vs t') 
                       
thetan = 2*pi*(rand(length(r2),1)-1);

[t,r3] = harmonics(w0,Cn,thetan,tmax,Tsample);
figure
plot(t(1:201),r3(1:201));
xlabel('time (s)')
ylabel('r3(t)')
title('r3(t) vs t')










