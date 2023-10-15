function data = Func_cap(V_set, C_set, I_set,R_set, Cap_set, vbi, vo)

% the two paramaters are Cg, Cd
w=2*pi*100e3;
C_type_num = 2;
Cg=Cap_set(1,1);
Cd=Cap_set(2,1);
Re=R_set(1,1);
Rp=R_set(2,1);
Rs=R_set(3,1);
Rbi=R_set(4,1);
% data is a vector of length R_type_num
%indicate F = V - I * R
data = zeros(C_type_num,1);

% Capacitance expression 电容表达式   ！！！！
% 这里要用一个类似阶跃的平滑函数把不同段的感抗方程合并为一个平滑的阻抗表达式，所以不需要分情况讨论了 ！！！
% 并且在表达式中,vbi和vo是常量，所以参数一共有四个
 % Cap is the capacitance of the circuit  
%V1=V_set-I_set*Re;
Vbi=vbi;
Vo=vo;
%Cap = (Rbi*V_set*V1*Cd*w*Rbi-Rbi*V_set*Vbi*Cd*w*Rbi+Rbi*V_set*V1*Rbi*2*Cg)/((V1-Vbi)^2+(V1*w*Cd*Rbi-Vbi*w*Cd*Rbi+V1*Rbi*w*Cg)^2);
% there should be R_type_num equations 方程 ！！！
for i = 1:C_type_num
    V1=V_set(i)-I_set(i)*Re;
    Cap = - Cg/(w*(exp(V_set(i) - Vbi) + 1)) - (Rbi*V_set(i)*(Cd*Rbi*V1*w + Cg*Rbi*V1*w - Cd*Rbi*Vbi*w))/(((Cd*Rbi*V1*w + Cg*Rbi*V1*w - Cd*Rbi*Vbi*w)^2 + (V1 - Vbi)^2)*(exp(Vbi - V_set(i)) + 1)*(exp(V_set(i) - Vo) + 1)) - (Rbi*Rp*Rs*V_set(i)*(Cd*V1*w + Cg*V1*w - Cd*Vbi*w)*(Rbi*Rp*V1 + Rbi*Rs*V1 + Rp*Rs*V1 - Rbi*Rp*Vo - Rp*Rs*Vbi)^2)/(exp(Vo - V_set(i)) + 1);
    data(i) = C_set(i) - Cap;
end