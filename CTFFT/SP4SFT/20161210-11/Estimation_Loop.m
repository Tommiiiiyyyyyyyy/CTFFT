function [ x_hat ] = Estimation_Loop( w, G, z_ft, hash, offset, tau, I_l )
%UNTITLED11 ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q

for i = 1:I_l
    x_hat = z_ft(hash(i))*w^(tau*i)/G(offset(i));
end
end

