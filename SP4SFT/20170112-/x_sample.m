function [ x ] = x_sample( n )
%UNTITLED3 この関数の概要をここに記述
%   詳細説明をここに記述
T = 1/n;             % Sampling period
L = n;             % Length of signal
t = (0:L-1)*T;        % Time vector
S = sin(2*pi*5*t) + 2*sin(2*pi*65*t) + .5*sin(2*pi*350*t) + .3*sin(2*pi*1000*t);
x = S;
%x = S + .2*randn(size(t));
end

