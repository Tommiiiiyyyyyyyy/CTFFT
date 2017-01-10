function [ x ] = x_sample( n )
%UNTITLED3 この関数の概要をここに記述
%   詳細説明をここに記述
T = 1/n;             % Sampling period
L = n;             % Length of signal
t = (0:L-1)*T;        % Time vector
S = 0.7*sin(2*pi*50*t) + sin(2*pi*120*t);
x = S + 1*randn(size(t));
end

