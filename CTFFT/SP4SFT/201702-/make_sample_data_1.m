function [ x ] = make_sample_data_1( n )
%UNTITLED21 ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q
T = 1/n;             % Sampling period
L = n;             % Length of signal
t = (0:L-1)*T;        % Time vector
S = sin(2*pi*1000*t);% + .5*sin(2*pi*350*t) + .3*sin(2*pi*1000*t);
x = S;
x = S + .2*randn(size(t));

end

