function paramater_extraction(~)
%step, for simulation 妯℃嫙 step
%epi for error margin  杈圭紭

%paramater num
R_type_num = 4;
C_type_num = 2;
V_type_num = 2;
epi=1e-10;
V = -8:0.1:8;
itera_cycles = (length(V)-1)/R_type_num;

im_xk(R_type_num,itera_cycles) = 0;
im_xk_new(R_type_num,itera_cycles) = 0;

cap_xk(C_type_num,itera_cycles)     = 0;
cap_xk_new(C_type_num,itera_cycles) = 0;

v_xk(V_type_num,itera_cycles)     = 0;
v_xk_new(V_type_num,itera_cycles) = 0;

%guess the initial value
%it is important for correct answer

Re_init = 1.6;
Rp_init = 350e3;
Rs_init = 2.66;
Rbi_init = 26;
Cg_init = 0.01;
Cd_init = 0.01;
Vbi_init = 0.2;
Vo_init = 1.0;
slope_factor_for_vbi_init = 0.026;
slope_factor_for_vo1_init =  0.026;
slope_factor_for_vo2_init = 0.026;
% values from case data
% read from case file
% 杩欓噷瑕佽ˉ鍏呬粠case鏂囦欢閲岃?诲彇鏁版嵁鐨勪唬鐮?

I = [-9.27e-11	
-9.97e-11	
-8.18e-11	
-1.01e-10	
-5.88e-11	
-6e-11	
-9.2e-11	
-7.4e-11	
-8.45e-11	
-8.04e-11	
-7.79e-11	
-5.54e-11	
-8.87e-11	
-3.31e-11	
-3.95e-11	
-7.85e-11	
-8.64e-11	
-6.26e-11	
-6.44e-11	
-7.65e-11	
-6.32e-11	
-6.75e-11	
-6.88e-11	
-5.63e-11	
-4.06e-11	
-5.96e-11	
-5.16e-11	
-7.94e-11	
-5.04e-11	
-5.56e-11	
-5.62e-11	
-3.95e-11	
-1.09e-10	
-2.77e-11	
-2.7e-11	
-7e-11	
-1.68e-11	
-4.61e-11	
-5.3e-11	
-4.22e-11	
-4.45e-11	
-3.33e-11	
-2.1e-11	
-3.97e-11	
-3.01e-11	
1.25e-11	
-8.13e-11	
-2.14e-11	
-3.68e-11	
-1.73e-11	
-1.02e-11	
-3.48e-11	
-3.18e-11	
-4.76e-11	
-1.83e-11	
-2.7e-12	
-5.85e-11	
-5.62e-11	
-4.63e-11	
1.67e-12	
-6.12e-11	
-4.12e-11	
-5.19e-11	
1.26e-11	
-5.29e-11	
-2.9e-11	
1.84e-12	
2.59e-11	
5.24e-12	
-1.38e-11	
-1.71e-11	
-5.3e-12	
7.93e-12	
5.37e-13	
3.27e-12	
-1.67e-11	
4.36e-12	
1.99e-11	
1.16e-11	
5.89e-11	
7.28e-11	
7.18e-11	
1.04e-10	
1.08e-10	
1.24e-10	
1.15e-10	
1.29e-10	
1.64e-10	
1.44e-10	
1.61e-10	
1.74e-10	
1.95e-10	
2.21e-10	
2.59e-10	
2.62e-10	
2.91e-10	
3.27e-10	
3.43e-10	
3.74e-10	
4.16e-10	
4.42e-10	
4.94e-10	
5.32e-10	
5.78e-10	
6.1e-10	
6.65e-10	
7.1e-10	
7.61e-10	
8.17e-10	
8.65e-10	
9.23e-10	
9.83e-10	
1.04e-09	
1.1e-09	
1.16e-09	
1.23e-09	
1.29e-09	
1.37e-09	
1.44e-09	
1.54e-09	
1.7e-09	
1.84e-09	
2.04e-09	
2.28e-09	
2.75e-09	
3.85e-09	
6.48e-09	
1.28e-08	
2.76e-08	
6.26e-08	
1.42e-07	
3.14e-07	
6.49e-07	
1.23e-06	
2.12e-06	
3.39e-06	
5.08e-06	
7.28e-06	
1.01e-05	
1.35e-05	
1.77e-05	
2.28e-05	
2.87e-05	
3.57e-05	
4.38e-05	
5.3e-05	
6.35e-05	
7.53e-05	
8.85e-05	
0.000103	
0.000119	
0.000137	
0.000157	
0.000178	
0.000201	
0.000226	
0.000253	
0.000281	
0.000312	
0.000345	
0.00038	];
C = [6.52e-10	
6.52e-10	
6.52e-10	
6.52e-10	
6.52e-10	
6.52e-10	
6.52e-10	
6.52e-10	
6.52e-10	
6.52e-10	
6.52e-10	
6.52e-10	
6.52e-10	
6.52e-10	
6.52e-10	
6.52e-10	
6.52e-10	
6.52e-10	
6.52e-10	
6.52e-10	
6.51e-10	
6.51e-10	
6.51e-10	
6.51e-10	
6.51e-10	
6.51e-10	
6.51e-10	
6.51e-10	
6.51e-10	
6.51e-10	
6.51e-10	
6.51e-10	
6.51e-10	
6.51e-10	
6.51e-10	
6.51e-10	
6.51e-10	
6.51e-10	
6.51e-10	
6.51e-10	
6.51e-10	
6.51e-10	
6.51e-10	
6.51e-10	
6.51e-10	
6.51e-10	
6.51e-10	
6.51e-10	
6.51e-10	
6.51e-10	
6.51e-10	
6.52e-10	
6.52e-10	
6.52e-10	
6.52e-10	
6.52e-10	
6.52e-10	
6.52e-10	
6.52e-10	
6.52e-10	
6.52e-10	
6.52e-10	
6.52e-10	
6.52e-10	
6.52e-10	
6.53e-10	
6.53e-10	
6.53e-10	
6.53e-10	
6.53e-10	
6.53e-10	
6.53e-10	
6.53e-10	
6.54e-10	
6.54e-10	
6.54e-10	
6.54e-10	
6.54e-10	
6.54e-10	
6.55e-10	
6.55e-10	
6.55e-10	
6.55e-10	
6.55e-10	
6.56e-10	
6.56e-10	
6.56e-10	
6.56e-10	
6.56e-10	
6.57e-10	
6.57e-10	
6.57e-10	
6.58e-10	
6.58e-10	
6.58e-10	
6.59e-10	
6.59e-10	
6.6e-10	
6.6e-10	
6.61e-10	
6.61e-10	
6.62e-10	
6.63e-10	
6.63e-10	
6.64e-10	
6.65e-10	
6.67e-10	
6.68e-10	
6.7e-10	
6.72e-10	
6.74e-10	
6.77e-10	
6.8e-10	
6.85e-10	
6.91e-10	
6.99e-10	
7.11e-10	
7.25e-10	
7.41e-10	
7.54e-10	
7.66e-10	
7.75e-10	
7.83e-10	
7.89e-10	
7.95e-10	
8e-10	
8.07e-10	
8.17e-10	
8.31e-10	
8.47e-10	
8.63e-10	
8.77e-10	
8.91e-10	
9.02e-10	
9.1e-10	
9.17e-10	
9.22e-10	
9.26e-10	
9.29e-10	
9.3e-10	
9.31e-10	
9.31e-10	
9.31e-10	
9.3e-10	
9.28e-10	
9.26e-10	
9.23e-10	
9.2e-10	
9.17e-10	
9.14e-10	
9.1e-10	
9.06e-10	
9.03e-10	
8.99e-10	
8.95e-10	
8.91e-10	
8.87e-10	
8.83e-10	
8.79e-10	
8.76e-10	
8.72e-10	];

% iterate  杩?浠? to solve the paramater
% initilize paramaters
im_xk_initial = [Re_init Rp_init Rs_init Rbi_init];
cap_xk_initial = [Cg_init Cd_init];
v_xk_initial = [Vbi_init Vo_init];
slope_xk_initial = [slope_factor_for_vbi_init slope_factor_for_vo1_init slope_factor_for_vo2_init];
im_xk(:,1) = im_xk_initial;
cap_xk(:,1) = cap_xk_initial;
v_xk(:,1) = v_xk_initial;
slope_xk(:,1) = slope_xk_initial;

% set the max iteration cycles to avoid the 
%nonconvergence of iteration
max_iteration_cycles = 1000;
% calculate the v-type paramaters at first
im_v_xk_initial = [im_xk_initial v_xk_initial slope_xk_initial];
im_v_xk(:,1) = im_v_xk_initial;
im_v_xk_new(:,1) = im_v_xk_initial;
for l = 1:max_iteration_cycles
    % select 6 points of equal distance from I-V data
    V_set = linspace(V(40),V(end),9);
    I_set = linspace(I(40),I(end),9);
    % I-V function
    F  = Func_im_v(V_set, I_set, im_v_xk(:,1));
    im_v_xk(:,1)
    F
    % Jacobian matrix
    JF = Jacob_matrix_im_v(V_set, I_set, im_v_xk(:,1));
    %==========================================
    %==========================================
    im_v_xk_new(:,1) = im_v_xk(:,1) + 0.1 * self_matrix_inv(JF)*F;
    for r = 1:size(im_v_xk_new)
        if im_v_xk_new(r,1) < 0
            im_v_xk_new(r,1) = im_v_xk(r,1);
        end
    end
    if norm(im_v_xk_new(:,1) - im_v_xk(:,1)) < 1e-9
        break;
    end
    if norm(F) < 1e-9
        break;
    end
    im_v_xk(:,1) = im_v_xk_new(:,1);
end
% extracted v-type paramaters 鎻愬彇鐢靛帇鍙傛暟
% iterate to solve impedance and capacitance 杩?浠ｈВ鍐抽樆鎶楃數瀹?
for k = 1 : itera_cycles
    % iterate to solve impedance
    for l = 1:max_iteration_cycles
        V_set = V((k-1)*R_type_num+1:k*R_type_num);
        I_set = I((k-1)*R_type_num+1:k*R_type_num);
        % I-V function
        F = Func_im(V_set, I_set, im_xk(:,k), vbi, vo);
        % Jacobian matrix
        JF = Jacob_matrix_im(V_set, I_set, im_xk(:,k), vbi, vo);
        im_xk_new(:,k) = im_xk(:,k) + self_matrix_inv(JF)*F;
        if norm(im_xk_new(:,k) - im_xk(:,k)) < 1e-3
            break;
        end
        if norm(F) < epi
            break;
        end
        im_xk(:,k) = im_xk_new(:,k);
    end
    % initilize the value of next iteration
    if k < itera_cycles
        im_xk(:,k+1) = im_xk_new(:,k);
    end

    % iterate to solve capacitance 杩?浠ｆ彁鍙栫數瀹?
    for l = 1:max_iteration_cycles
        % 鐢变簬鐢靛?瑰彧闇€瑕佷袱缁勬暟鎹?鐐癸紝鎵€浠ュ湪鍙栨暟鎹?鐐圭殑鏃跺€欐槸闂撮殧鍙栫殑
        V_set = V(2*(k-1)*C_type_num+1:2*k*C_type_num);
        C_set = C(2*(k-1)*C_type_num+1:2*k*C_type_num);
        % C-V function
        F = Func_cap(V_set, C_set, I_set,im_xk(:,k),cap_xk(:,k), vbi, vo);
        % Jacobian matrix
        JF = Jacob_matrix_cap(V_set, C_set, I_set,im_xk(:,k), vbi, vo);
        %JF = Jacob_matrix_cap(V_set, C_set, im_xk(:,k),cap_xk(C_type_num,k), vbi, vo);
        cap_xk_new(:,k) = cap_xk(:,k) - self_matrix_inv(JF)*F;
        if norm(cap_xk_new(:,k) - cap_xk(:,k)) < 1e-2
            break;
        end
        if norm(F) < epi
            break;
        end
        cap_xk(:,k) = cap_xk_new(:,k);
    end
end
m=1:1:k;
% plot the result
%plot(m,im_xk(1,:));
plot(m,im_xk(2,:));
%plot(m,im_xk(3,:));
%plot(m,im_xk(4,:));
%disp(F);R_type_num;C_type_num;V_type_num;itera_cycles;im_xk;cap_xk;v_xk;I;V
% disp(R_type_num);
% disp(C_type_num);
% disp(V_type_num);
% disp(itera_cycles);
%disp(im_xk);
% disp(cap_xk);
% disp(v_xk);
% disp(I);
% disp(V);
% disp(V_set);
% disp(I_set);
% disp(C_set);
% disp(im_v_xk(:,1));
% disp(im_xk_initial);
% disp(v_xk_initial);
% disp(im_v_xk_initial);
% write the paramater to model card file   paramater_extraction
