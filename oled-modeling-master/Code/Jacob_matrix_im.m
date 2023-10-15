function data = Jacob_matrix_im(V_set, I_set, R_set, vbi, vo)
Cd=1;
Cg=1;
R_type_num = 4;
Re=R_set(1,1);
Rp=R_set(2,1);
Rs=R_set(3,1);
Rbi=R_set(4,1);
Vbi= vbi;
Vo= vo;
% Jacobian matrix
data = zeros(R_type_num,R_type_num);
slope_factor = 0.1;
% to be implemented
for i = 1:R_type_num
data(:,i)=[ (Re*((Rbi*(Vbi - V_set(i)))/(exp((Vbi - V_set(i))/slope_factor) + 1) - (Rp*V_set(i))/(exp((Vo - V_set(i))/slope_factor) + 1) + (Rs*(Vo - V_set(i)))/(exp((Vo - V_set(i))/slope_factor) + 1)))/((Re + Rbi/(exp((Vbi - V_set(i))/slope_factor) + 1) + Rp/(exp((Vo - V_set(i))/slope_factor) + 1) + Rs/(exp((Vo - V_set(i))/slope_factor) + 1))^2) - ((Rbi*(Vbi - V_set(i)))/(exp((Vbi - V_set(i))/slope_factor) + 1) - (Rp*V_set(i))/(exp((Vo - V_set(i))/slope_factor) + 1) + (Rs*(Vo - V_set(i)))/(exp((Vo - V_set(i))/slope_factor) + 1))/((Re + Rbi/(exp((Vbi - V_set(i))/slope_factor) + 1) + Rp/(exp((Vo - V_set(i))/slope_factor) + 1) + Rs/(exp((Vo - V_set(i))/slope_factor) + 1)))
                 (Re*V_set(i))/((exp((Vo - V_set(i))/slope_factor) + 1)*(Re + Rbi/(exp((Vbi - V_set(i))/slope_factor) + 1) + Rp/(exp((Vo - V_set(i))/slope_factor) + 1) + Rs/(exp((Vo - V_set(i))/slope_factor) + 1))) + (Re*((Rbi*(Vbi - V_set(i)))/(exp((Vbi - V_set(i))/slope_factor) + 1) - (Rp*V_set(i))/(exp((Vo - V_set(i))/slope_factor) + 1) + (Rs*(Vo - V_set(i)))/(exp((Vo - V_set(i))/slope_factor) + 1)))/((exp((Vo - V_set(i))/slope_factor) + 1)*(Re + Rbi/(exp((Vbi - V_set(i))/slope_factor) + 1) + Rp/(exp((Vo - V_set(i))/slope_factor) + 1) + Rs/(exp((Vo - V_set(i))/slope_factor) + 1))^2)
                 (Re*((Rbi*(Vbi - V_set(i)))/(exp((Vbi - V_set(i))/slope_factor) + 1) - (Rp*V_set(i))/(exp((Vo - V_set(i))/slope_factor) + 1) + (Rs*(Vo - V_set(i)))/(exp((Vo - V_set(i))/slope_factor) + 1)))/((exp((Vo - V_set(i))/slope_factor) + 1)*(Re + Rbi/(exp((Vbi - V_set(i))/slope_factor) + 1) + Rp/(exp((Vo - V_set(i))/slope_factor) + 1) + Rs/(exp((Vo - V_set(i))/slope_factor) + 1))^2) - (Re*(Vo - V_set(i)))/((exp((Vo - V_set(i))/slope_factor) + 1)*(Re + Rbi/(exp((Vbi - V_set(i))/slope_factor) + 1) + Rp/(exp((Vo - V_set(i))/slope_factor) + 1) + Rs/(exp((Vo - V_set(i))/slope_factor) + 1)))
                 (Re*((Rbi*(Vbi - V_set(i)))/(exp((Vbi - V_set(i))/slope_factor) + 1) - (Rp*V_set(i))/(exp((Vo - V_set(i))/slope_factor) + 1) + (Rs*(Vo - V_set(i)))/(exp((Vo - V_set(i))/slope_factor) + 1)))/((exp((Vbi - V_set(i))/slope_factor) + 1)*(Re + Rbi/(exp((Vbi - V_set(i))/slope_factor) + 1) + Rp/(exp((Vo - V_set(i))/slope_factor) + 1) + Rs/(exp((Vo - V_set(i))/slope_factor) + 1))^2) - (Re*(Vbi - V_set(i)))/((exp((Vbi - V_set(i))/slope_factor) + 1)*(Re + Rbi/(exp((Vbi - V_set(i))/slope_factor) + 1) + Rp/(exp((Vo - V_set(i))/slope_factor) + 1) + Rs/(exp((Vo - V_set(i))/slope_factor) + 1)))
    ];
end