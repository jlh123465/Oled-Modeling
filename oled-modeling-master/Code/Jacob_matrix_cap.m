function data = Jacob_matrix_cap(V_set, C_set, I_set,R_set,  vbi, vo)
w=2*pi*100e3;
C_type_num = 2;%Cd,Cg
Cg=C_set(1,1);
Cd=C_set(2,1);
Re=R_set(1,1);
Rp=R_set(2,1);
Rs=R_set(3,1);
Rbi=R_set(4,1);
Vbi= vbi;
Vo= vo;
% Jacobian matrix 矩阵
data = zeros(C_type_num,C_type_num);

% to be implemented 实现
for i = 1:C_type_num
    
data(:,i)=[(Rbi*V_set(i)*(Rbi*Vbi*w - Rbi*w*(V_set(i) - I_set(i)*Re)))/((exp(Vbi - V_set(i)) + 1)*(exp(V_set(i) - Vo) + 1)*((Cd*Rbi*w*(V_set(i) - I_set(i)*Re) + Cg*Rbi*w*(V_set(i) - I_set(i)*Re) - Cd*Rbi*Vbi*w)^2 + (Vbi - V_set(i) + I_set(i)*Re)^2)) - (2*Rbi*V_set(i)*(Rbi*Vbi*w - Rbi*w*(V_set(i) - I_set(i)*Re))*(Cd*Rbi*w*(V_set(i) - I_set(i)*Re) + Cg*Rbi*w*(V_set(i) - I_set(i)*Re) - Cd*Rbi*Vbi*w)^2)/((exp(Vbi - V_set(i)) + 1)*(exp(V_set(i) - Vo) + 1)*((Cd*Rbi*w*(V_set(i) - I_set(i)*Re) + Cg*Rbi*w*(V_set(i) - I_set(i)*Re) - Cd*Rbi*Vbi*w)^2 + (Vbi - V_set(i) + I_set(i)*Re)^2)^2) + (Rbi*Rp*Rs*V_set(i)*(Vbi*w - w*(V_set(i) - I_set(i)*Re))*(Rbi*Rp*(V_set(i) - I_set(i)*Re) - Rp*Rs*Vbi - Rbi*Rp*Vo + Rbi*Rs*(V_set(i) - I_set(i)*Re) + Rp*Rs*(V_set(i) - I_set(i)*Re))^2)/(exp(Vo - V_set(i)) + 1)
    (2*Rbi^2*V_set(i)*w*(V_set(i) - I_set(i)*Re)*(Cd*Rbi*w*(V_set(i) - I_set(i)*Re) + Cg*Rbi*w*(V_set(i) - I_set(i)*Re) - Cd*Rbi*Vbi*w)^2)/((exp(Vbi - V_set(i)) + 1)*(exp(V_set(i) - Vo) + 1)*((Cd*Rbi*w*(V_set(i) - I_set(i)*Re) + Cg*Rbi*w*(V_set(i) - I_set(i)*Re) - Cd*Rbi*Vbi*w)^2 + (Vbi - V_set(i) + I_set(i)*Re)^2)^2) - (Rbi^2*V_set(i)*w*(V_set(i) - I_set(i)*Re))/((exp(Vbi - V_set(i)) + 1)*(exp(V_set(i) - Vo) + 1)*((Cd*Rbi*w*(V_set(i) - I_set(i)*Re) + Cg*Rbi*w*(V_set(i) - I_set(i)*Re) - Cd*Rbi*Vbi*w)^2 + (Vbi - V_set(i) + I_set(i)*Re)^2)) - 1/(w*(exp(V_set(i) - Vbi) + 1)) - (Rbi*Rp*Rs*V_set(i)*w*(V_set(i) - I_set(i)*Re)*(Rbi*Rp*(V_set(i) - I_set(i)*Re) - Rp*Rs*Vbi - Rbi*Rp*Vo + Rbi*Rs*(V_set(i) - I_set(i)*Re) + Rp*Rs*(V_set(i) - I_set(i)*Re))^2)/(exp(Vo - V_set(i)) + 1)
    ];
end