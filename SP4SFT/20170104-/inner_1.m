function [ tau, sigma ] = inner_1(n)
%inner_01 ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q
tau = randi(n);
sigma = 2*randi(n/2) - 1;
end

