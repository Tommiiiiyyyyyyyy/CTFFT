function [ I_d ] = Outer_Loop2_3( I, L, n )
%UNTITLED14 ���̊֐��̊T�v�������ɋL�q
%   Outer Loop 2 �� 3�D
S = sum(I,2);
I_d = (S > max(S)/3);%���[�D�_���ł́CL/2 �ƂȂ��Ă��܂����C���ꂾ��L���傫���Ȃ�ƂقƂ�ǈ���������Ȃ��Ȃ�܂��D
end

