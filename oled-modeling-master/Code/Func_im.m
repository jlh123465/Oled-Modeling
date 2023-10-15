function data = Func_im(V_set, I_set, R_set, vbi, vo)
% the four paramaters are Re, Rp, Rs, Rbi
R_type_num = 4;
Re=R_set(1,1);
Rp=R_set(2,1);
Rs=R_set(3,1);
Rbi=R_set(4,1);
% data is a vector 向量 of length R_type_num
%indicate F = V - I * R 表明
data = zeros(R_type_num,1);

% Impedance expression 阻抗表达式
% 这里要用一个类似阶跃的平滑函数把不同段的阻抗方程合并为一个平滑的阻抗表达式，所以不需要分情况讨论了
% 并且在表达式中,vbi和vo是常量，所以参数一共有四个
 % Im is the impedance of the circuit
%V1=V_set-I_set*Re;
Vbi=vbi;
Vo=vo;
%Im =(Rbi*V_set*(V1-Vbi))/((V1-Vbi)^2+(V1*w*Cd*Rbi-Vbi*w*Cd*Rbi+V1*Rbi*w*Cg)^2);
% there should be R_type_num equations
slope_factor_for_vbi = 0.1;
slope_factor_for_vo1 =  0.1;
slope_factor_for_vo2 = 0.01;
for i = 1:R_type_num
    sigmoid_from_vbi = 1/(1+exp((Vbi-V_set(i))/slope_factor_for_vbi));
    sigmoid_from_vo1 = 1/(1+exp((Vo-V_set(i))/slope_factor_for_vo1));
    sigmoid_from_vo2 = 1/(1+exp((Vo-V_set(i))/slope_factor_for_vo2));
    Rbi_valid = Rbi * sigmoid_from_vbi;
    Rs_valid = Rs * sigmoid_from_vo1;
    Rp_valid = Rp * sigmoid_from_vo2;
    I = (V_set(i)*Rp_valid - (Vbi-V_set(i)) * Rbi_valid - (Vo-V_set(i)) * Rs_valid) / ((Rbi_valid + Rs_valid + Rp_valid + Re)/Re);
    data(i) = (I_set(i) - I);
end