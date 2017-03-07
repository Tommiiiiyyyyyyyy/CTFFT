function [ x_ft ] = normal_fft( x, n, omega )
%UNTITLED22 この関数の概要をここに記述
%   詳細説明をここに記述
x_ft = zeros(n,1);
for i = 1:n
    x_ft(i) = omega(-i*(1:n), n)*x';
end
end

