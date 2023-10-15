function data = Func_im_v(V_set, I_set, R_V_set)

% the six paramaters are Re, Rp, Rs, Rbi, Vbi, Vo
paramaters_num = 9;
Re = R_V_set(1,1);
Rp = R_V_set(2,1);
Rs = R_V_set(3,1);
Rbi = R_V_set(4,1);
Vbi = R_V_set(5,1);
Vo = R_V_set(6,1);
slope_factor_for_vbi = R_V_set(7,1);
slope_factor_for_vo1 =  R_V_set(8,1);
slope_factor_for_vo2 = R_V_set(9,1);

% data is a vector of length R_type_num
%indicate F = V- I * R
data = zeros(paramaters_num ,1);

% 这里要用一个类似阶跃的平滑函数把不同段的阻抗方程合并为一个平滑的阻抗表达式
% 并且在表达式中,vbi和vo也算作变量，所以参数一共有六个
%V1=V_set(i)-I_set*Re;
%Im =(Rbi*V_set(i)*(V1-Vbi))/((V1-Vbi)^2+(V1*w*Cd*Rbi-Vbi*w*Cd*Rbi+V1*Rbi*w*Cg)^2); % Im is the impedance of the circuit 电路
%F=V_set(i)-I_set*Im;
% there should be R_type_num equations

for i = 1:paramaters_num
    sigmoid_from_vbi = 1/(1+exp((Vbi-V_set(i))/slope_factor_for_vbi));
    sigmoid_from_vo1 = 1/(1+exp((Vo-V_set(i))/slope_factor_for_vo1));
    sigmoid_from_vo2 = 1/(1+exp((Vo-V_set(i))/slope_factor_for_vo2));
    Rbi_valid = 1/Rbi * sigmoid_from_vbi;
    Rs_valid = 1/Rs * sigmoid_from_vo1;
    Rp_valid = 1/Rp * sigmoid_from_vo2;
    I = (V_set(i)*Rp_valid - (Vbi-V_set(i)) * Rbi_valid - (Vo-V_set(i)) * Rs_valid) / ((Rbi_valid + Rs_valid + Rp_valid + Re)/Re);
    data(i) = (I_set(i) - I);
end