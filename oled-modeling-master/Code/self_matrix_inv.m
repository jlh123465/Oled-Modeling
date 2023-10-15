%calcurate the inverse of matrix 计算矩阵的逆
function y=self_matrix_inv(squard_matrix)
[M,N]=size(squard_matrix);
if(M~=N)
    disp('matrix is not squared.');
    return;
 end
det_y=det(squard_matrix);
if(abs(det_y) < 1.0e-08)
    y = pinv(squard_matrix,1.0e-08);
else
    A=zeros(N-1,N-1);
    for n=1:N 
        for m=1:N
            %calcurate  algebraic complement
            A(m,n)=(-1)^(m+n)*det(squard_matrix([1:n-1,n+1:N],[1:m-1,m+1:N]));
        end
    end
    y=A./det_y;
end