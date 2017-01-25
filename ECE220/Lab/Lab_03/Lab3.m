%Lab 3 

%3.2 Response to a curb

%a kd = 2*10^4
kd = 2*10^4; %We will Change kd
m = 250; %Parameter Values
ks = 10^5;
A1 = 0.1;

b = [kd/m, ks/m];
a = [1, kd/m, ks/m];

SYS = tf(b,a); %System

t = linspace(0,10,10000);
ya = A1*step(SYS,t);
subplot(3,1,1)
plot(t,ya)
xlabel('time (s)','Interpreter','latex')
ylabel('y(t)','Interpreter','latex')
title('Position of Car Over a Curb kd = $2 \cdot 10^4$','Interpreter','latex')

%b. kd = 10^4
kd = 10^4;
b = [kd/m, ks/m];
a = [1, kd/m, ks/m];
SYS = tf(b,a);
ya = A1*step(SYS,t);
subplot(3,1,2)
plot(t,ya)
xlabel('time (s)','Interpreter','latex')
ylabel('y(t)','Interpreter','latex')
title('Position of Car Over a Curb kd = $10^4$','Interpreter','latex')

%c. kd = 5000
kd = 5000;
b = [kd/m, ks/m];
a = [1, kd/m, ks/m];
SYS = tf(b,a);
ya = A1*step(SYS,t);
subplot(3,1,3)
plot(t,ya)
xlabel('time (s)','Interpreter','latex')
ylabel('y(t)','Interpreter','latex')
title('Position of Car Over a Curb kd = $5 \cdot 10^3$','Interpreter','latex')


%Position over a pothole
figure
%a. kd = 10^4 
A2 = 0.1;
kd = 10^4;
b = [kd/m, ks/m];
a = [1, kd/m, ks/m];
SYS = tf(b,a);
x = zeros(size(t));
x(t<(1/5)) = -A2;
ya = lsim(SYS,x,t);
subplot(2,1,1)
plot(t,ya)
xlabel('time (s)','Interpreter','latex')
ylabel('y(t)','Interpreter','latex')
title('Position of Car Over a Pothole kd = $10^4$','Interpreter','latex')


%b. kd = 2000 
A2 = 0.1;
kd = 2000;
b = [kd/m, ks/m];
a = [1, kd/m, ks/m];
SYS = tf(b,a);
x = zeros(size(t));
x(t<(1/5)) = -A2;
ya = lsim(SYS,x,t);
subplot(2,1,2)
plot(t,ya)
xlabel('time (s)','Interpreter','latex')
ylabel('y(t)','Interpreter','latex')
title('Position of Car Over a Pothole kd = $2\cdot 10^3$','Interpreter','latex')

figure
% Position over wavy pavement 
kd = 10^4;
A3 = .05; 
T0 = 0.314;
p = @(t) A3*cos(2*pi*t/T0);
b = [kd/m, ks/m];
a = [1, kd/m, ks/m];
SYS = tf(b,a);
yc =lsim(SYS,p(t),t);
plot(t,yc)
xlabel('time (s)','Interpreter','latex')
ylabel('y(t)','Interpreter','latex')
title('Position of Car Over a Wavy Road kd =$10^4$','Interpreter','latex')










