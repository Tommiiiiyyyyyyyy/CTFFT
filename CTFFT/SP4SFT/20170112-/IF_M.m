function [ IF_M ] = IF_M( n, w )
%F_M n+1 �����̋�֐��̋t�t�[���G�ϊ����s���s��𐶐����܂��D
% n �͕K�������C�ł����2�̊K����w�肵�Ă��������D
IF_M = zeros(n+1);
for i = 1:n+1
    for j = 1:n+1
        IF_M(i,j) = w((i-(n/2+1))*(j-(n/2+1)) ,n+1);
    end
end
IF_M = IF_M/(n+1);
end