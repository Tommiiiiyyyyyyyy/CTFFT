function [ x ] = make_sample_data_1( n )
%UNTITLED21 ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q
T = 1/n;             % Sampling period
L = n;             % Length of signal
t = (0:L-1)*T;        % Time vector
S = sin(2*pi*t*10^6);
x = S;
x = S + 2^(-0.5)*randn(size(t));

end

