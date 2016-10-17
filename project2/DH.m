function J = DH(X,t);
x = X(1); y = X(2); z = X(3); d = X(4);

RHO = 26570; c = 299792.458; d_exact = 0.0001;
THETA_1 = 0; THETA_2 = pi/2; THETA_3 = pi; THETA_4 = 3*pi/4;
PHI_1 = pi/4; PHI_2 = 3*pi/4; PHI_3 = pi/2; PHI_4 = 5*pi/3;

A_1 = RHO * cos(PHI_1) * cos(THETA_1);
A_2 = RHO * cos(PHI_2) * cos(THETA_2);
A_3 = RHO * cos(PHI_3) * cos(THETA_3);
A_4 = RHO * cos(PHI_4) * cos(THETA_4);
A= [A_1 A_2 A_3 A_4];

B_1 = RHO * cos(PHI_1) * sin(THETA_1);
B_2 = RHO * cos(PHI_2) * sin(THETA_2);
B_3 = RHO * cos(PHI_3) * sin(THETA_3);
B_4 = RHO * cos(PHI_4) * sin(THETA_4);
B= [B_1 B_2 B_3 B_4];

C_1 = RHO * sin(PHI_1); 
C_2 = RHO * sin(PHI_2);
C_3 = RHO * sin(PHI_3);
C_4 = RHO * sin(PHI_4);
C= [C_1 C_2 C_3 C_4];

R_1 = sqrt(A_1^2 + B_1^2 +(C_1 - 6370)^2);
R_2 = sqrt(A_2^2 + B_2^2 +(C_2 - 6370)^2);
R_3 = sqrt(A_3^2 + B_3^2 +(C_3 - 6370)^2);
R_4 = sqrt(A_4^2 + B_4^2 +(C_4 - 6370)^2);
R = [R_1 R_2 R_3 R_4];

 
t_1 = t(1); t_2 = t(2); t_3 = t(3); t_4 = t(4);



j_11 = 2 * (x - A_1); j_21 = 2 * (x - A_2); j_31 = 2 * (x - A_3); j_41 = 2 * (x - A_4);
j_12 = 2 * (y - B_1); j_22 = 2 * (y - B_2); j_32 = 2 * (y - B_3); j_42 = 2 * (y - B_4);
j_13 = 2 * (z - C_1); j_23 = 2 * (z - C_2); j_33 = 2 * (z - C_3); j_43 = 2 * (z - C_4);
j_14 = 2 * c^2 * (t_1 - d); j_24 = 2 * c^2 * (t_2 - d); j_34 = 2 * c^2 * (t_3 - d); j_44 = 2 * c^2 * (t_4 - d);

J = [j_11, j_12, j_13, j_14; j_21, j_22, j_23, j_24; j_31, j_32, j_33, j_34; j_41, j_42, j_43, j_44];
