function [ y] = Inner_Loop2( sigma, tau, flatwin, x, n )
%UNTITLED8 この関数の概要をここに記述
%   詳細説明をここに記述
y = zeros(n,1);
for i = 1:n 
    sigtau = mod(sigma*i + tau, n);
    sigtau = sigtau + (sigtau == 0)*n;
    y(i) = x(sigtau)*flatwin(i);
end
end

