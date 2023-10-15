syms Re Rbi Rs Rp Cd Cg V1 Vo Vbi w V I a b c d e V_set(i) I_set(i) slope_factor_for_vo1 slope_factor_for_vo2 slope_factor_for_vbi; 
f = I_set(i) - ((V_set(i)/Rp * 1/(1+exp((Vo-V_set(i))/slope_factor_for_vo1)) - (Vbi-V_set(i)) / Rbi * 1/(1+exp((Vbi-V_set(i))/slope_factor_for_vbi)) - (Vo-V_set(i)) / Rs * 1/(1+exp((Vo-V_set(i))/slope_factor_for_vo2))) / ((1/Rbi * 1/(1+exp((Vbi-V_set(i))/slope_factor_for_vbi)) + 1/Rs * 1/(1+exp((Vo-V_set(i))/slope_factor_for_vo2)) + 1/Rp * 1/(1+exp((Vo-V_set(i))/slope_factor_for_vo1)) + 1/Re)*Re))


diff(f,Re)
diff(f,Rp)
diff(f,Rs)
diff(f,Rbi)
diff(f,Vbi)
diff(f,Vo)
diff(f,slope_factor_for_vbi)
diff(f,slope_factor_for_vo1)
diff(f,slope_factor_for_vo2)