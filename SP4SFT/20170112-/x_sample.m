function [ x ] = x_sample( n )
%UNTITLED3 ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q
T = 1/n;             % Sampling period
L = n;             % Length of signal
t = (0:L-1)*T;        % Time vector
S = 0.5*sin(2*pi*15*t) + .5*sin(2*pi*45*t);
x = S;% + .1*randn(size(t));
end

