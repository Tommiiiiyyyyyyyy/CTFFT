function [ x_ft ] = normal_fft( x, n, omega )
%UNTITLED22 ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q
x_ft = zeros(n,1);
for i = 1:n
    x_ft(i) = omega(-i*(1:n), n)*x';
end
end

