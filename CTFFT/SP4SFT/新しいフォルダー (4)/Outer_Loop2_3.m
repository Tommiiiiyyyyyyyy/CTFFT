function [ I_d ] = Outer_Loop2_3( I, L, n )
%UNTITLED14 ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q
S = sum(I,2);
I_d = (S > max(S)/3);
end

