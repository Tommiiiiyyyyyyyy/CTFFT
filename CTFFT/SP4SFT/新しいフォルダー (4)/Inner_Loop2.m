function [ y] = Inner_Loop2( sigma, tau, flatwin, x, n )
%UNTITLED8 ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q
y = zeros(n,1);
sigtau = sigma*(1:n) + tau;
sigtau = mod(sigtau, n);
sigtau = sigtau + (sigtau == 0)*n;
y = x(sigtau(1:n))'.*flatwin(1:n);
end

