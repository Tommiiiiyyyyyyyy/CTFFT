function [ I_d ] = Outer_Loop2_3( I, L, n )
%UNTITLED14 ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q
S = zeros(n,1);
S = I*ones(L, 1);
I_d = (S > max(S)/3);%�ł������I�΂ꂽ���W�̓��[����1/3��臒l�ɂ��܂����D
end

