Lab 2 Part 3

t = linspace(0,2,1000); %time vector
tp0 = linspace(0,2,2000);

p0 = [ones(1,1000), zeros(1,1000)]; %1000 ones then 1000 zeros

p1 = conv(p0,p0); % convolution
p1 = downsample(p1,2); %scaled time
p1_max = max(p1); %max value 
p1 = p1/p1_max; %scaled output

p2 = conv(p1,p1);
p2 = downsample(p2,2);
p2_max = max(p2);
p2 = p2/p2_max;

p3 = conv(p2,p2);
p3 = downsample(p3,2);
p3_max = max(p3);
p3 = p3/p3_max;

figure;
hold on;
plot(tp0,p0)
xlabel('time')
ylabel('p')
title('p convolutions vs time')

plot(t,p1(1:1000))

plot(t,p2(1:1000))

plot(t,p3(1:1000))

legend('p0','p1','p2','p3')
hold off;
%part g

t = linspace(0,2,2000); %time vector

w0 = rand(1,2000);
soundsc(w0,2000); % sounds like wind

w1 = conv(w0,w0); 
w1 = downsample(w1,2);
w1_max = max(w1);
w1 = w1 / w1_max;

w2 = conv(w1,w1);
w2 = downsample(w2,2);
w2_max = max(w2);
w2 = w2/w2_max;

w3 = conv(w2,w2);
w3 = downsample(w3,2);
w3_max = max(w3);
w3 = w3/w3_max;

figure
hold on

plot(t,w1)
xlabel('time')
ylabel('w')
title('w convolutions vs time')

plot(t,w2)

plot(t,w3)


hold off;

%part j
tp = linspace(0,2,1000); % Scales t so that p is nonzero
figure
plot(t,w3,'r',tp,p3(1:1000),'g')
xlabel('time')
ylabel('Convolution Output')
title('w3 and p3 vs time')
legend('w3(t)', 'p3(t')

%part l 
a = 0.2;
g = @(t) exp(-.5*(((t-1)/a).^2));
figure
plot(t,g(t));
title('Gaussian Function With a = 0.2')
xlabel('time')
ylabel('g(t)')
% plot of Gaussian looks the same as w3 and similar to w3 and p3
% p3 is shifted, but looks identical to w3



