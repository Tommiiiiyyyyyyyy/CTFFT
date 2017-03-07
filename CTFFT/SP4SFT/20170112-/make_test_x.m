function [ x_test ] = make_test_x( n )
%UNTITLED5 ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q
T = 1/n;             % Sampling period
L = n;             % Length of signal
t = (0:L-1)*T;        % Time vector
S = 0% + sin(2*pi*15*t);
x_ft = complex(S + randn(1, n)/10,randn(1, n)/10);


x_test = real(ifft(x_ft));
end

