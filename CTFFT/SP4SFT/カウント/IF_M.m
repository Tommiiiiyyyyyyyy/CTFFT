function [ IF_M ] = IF_M( n, omega )
%F_M n+1 �����̋�֐��̋t�t�[���G�ϊ����s���s��𐶐����܂��D
% n �͕K�������C�ł����2�̊K����w�肵�Ă��������D
IF_M = omega((-n/2:n/2)'*(-n/2:n/2) , n+1);
IF_M = IF_M/(n+1);
end