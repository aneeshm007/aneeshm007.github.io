function ans = quad()
A_1 = 15600; A_2 = 18760; A_3 = 17610; A_4 = 19170;
B_1 = 7540;  B_2 = 2750;  B_3 = 14630; B_4 = 610;
C_1 = 20140; C_2 = 18610; C_3 = 13480; C_4 = 18390;

t_1 = 0.07074; t_2 = 0.07220; t_3 = 0.07690; t_4 = 0.07242;
c = 299792.458;

ux = [-2*(A_1-A_2);-2*(A_1-A_3);-2*(A_1-A_4)];
uy = [-2*(B_1-B_2);-2*(B_1-B_3);-2*(B_1-B_4)];
uz = [-2*(C_1-C_2);-2*(C_1-C_3);-2*(C_1-C_4)];
ud = [2*c^2*(t_1-t_2);2*c^2*(t_1-t_3); 2*c^2*(t_1-t_4)];
w = [(A_1^2 - A_2^2) + (B_1^2 - B_2^2) + (C_1^2 - C_2^2) - c^2*(t_1^2-t_2^2);
     (A_1^2 - A_3^2) + (B_1^2 - B_3^2) + (C_1^2 - C_3^2) - c^2*(t_1^2-t_3^2);
     (A_1^2 - A_4^2) + (B_1^2 - B_4^2) + (C_1^2 - C_4^2) - c^2*(t_1^2-t_4^2);];
k_1 = det([uy uz ud])/det([uy uz ux])
j_1 = det([uy uz w])/det([uy uz ux])

k_2 = det([ux uz ud])/det([ux uz uy]);
j_2 = det([ux uz w])/det([ux uz uy]);

k_3 = det([ux uy ud])/det([ux uy uz]);
j_3 = det([ux uy w])/det([ux uy uz]);


p = [(k_1^2 + k_2^2 + k_3^2 - c^2) (2*k_1*j_1 + 2*A_1*k_1 + 2*k_2*j_2 + 2*k_2*B_1 + 2*k_3*j_3 + 2*C_1*k_3 + 2*c^2*t_1)  (j_1^2 + j_2^2 + j_3^2 + 2*j_1*A_1+ 2*j_2*B_1 + 2*j_3*C_1 + A_1^2 + B_1^2 + C_1^2 - c^2*t_1^2)];

ans = roots(p);