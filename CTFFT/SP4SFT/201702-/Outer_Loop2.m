function [ I_d ] = Outer_Loop2( I, L )
%UNTITLED14 ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q
S = zeros(n,1);
S = I*ones(L, 1);
I_d = (S > L/3);
end

