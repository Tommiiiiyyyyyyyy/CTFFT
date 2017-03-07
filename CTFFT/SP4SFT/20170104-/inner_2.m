function [ y ] = inner_2(sigma, tau, x, G)
%inner_2 ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q
y = zeros(n,1);
for i = 1:n
    sigtau = mod(sigma*i + tau, n);
    sigtau = sigtau + (sigtau == 0)*n;
    y(i) = x(sigtau)*G(i);
end

end

