function [ X_hat_d ] = Outer_Loop5( n, I_d, x_hat )
%UNTITLED18 ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q
X_hat_d = zeros(n, 1);
for k = 1:n
    if I_d(k) == 1
        X_hat_d(k) = complex(median(real(x_hat(k,:))), median(imag(x_hat(k,:))));
    end
end

end

