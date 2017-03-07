function [ y] = Inner_Loop2( sigma, tau, flatwin, x, n )
%UNTITLED8 この関数の概要をここに記述
%   詳細説明をここに記述
y = zeros(n,1);
sigtau = sigma*(1:n) + tau;
sigtau = mod(sigtau, n);
sigtau = sigtau + (sigtau == 0)*n;
y = x(sigtau(1:n))'.*flatwin(1:n);
end

