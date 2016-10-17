function y = H(X,t)
x = X(1); y = X(2); z = X(3); d = X(4);
x = X(1); y = X(2); z = X(3); d = X(4);

RHO = 26570; c = 299792.458; d_exact = 0.0001;
THETA_1 = 0; THETA_2 = pi/2; THETA_3 = pi; THETA_4 = 3*pi/4;
PHI_1 = pi/4; PHI_2 = 3*pi/4; PHI_3 = pi/2; PHI_4 = 5*pi/3;

A_1 = RHO * cos(PHI_1) * cos(THETA_1);
A_2 = RHO * cos(PHI_2) * cos(THETA_2);
A_3 = RHO * cos(PHI_3) * cos(THETA_3);
A_4 = RHO * cos(PHI_4) * cos(THETA_4);


B_1 = RHO * cos(PHI_1) * sin(THETA_1);
B_2 = RHO * cos(PHI_2) * sin(THETA_2);
B_3 = RHO * cos(PHI_3) * sin(THETA_3);
B_4 = RHO * cos(PHI_4) * sin(THETA_4);


C_1 = RHO * sin(PHI_1); 
C_2 = RHO * sin(PHI_2);
C_3 = RHO * sin(PHI_3);
C_4 = RHO * sin(PHI_4);


R_1 = sqrt(A_1^2 + B_1^2 +(C_1 - 6370)^2);
R_2 = sqrt(A_2^2 + B_2^2 +(C_2 - 6370)^2);
R_3 = sqrt(A_3^2 + B_3^2 +(C_3 - 6370)^2);
R_4 = sqrt(A_4^2 + B_4^2 +(C_4 - 6370)^2);


t_1 = t(1);
t_2 = t(2);
t_3 = t(3);
t_4 = t(4);





x_1 = (x - A_1)^2 + (y - B_1)^2 + (z - C_1)^2 - c^2 * (t_1 - d)^2;
x_2 = (x - A_2)^2 + (y - B_2)^2 + (z - C_2)^2 - c^2 * (t_2 - d)^2;
x_3 = (x - A_3)^2 + (y - B_3)^2 + (z - C_3)^2 - c^2 * (t_3 - d)^2;
x_4 = (x - A_4)^2 + (y - B_4)^2 + (z - C_4)^2 - c^2 * (t_4 - d)^2;

y = [x_1, x_2, x_3, x_4]';