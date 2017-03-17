function [ N, c, flatwin_c, d_c, l, k, B, prm_mat, filename_prm, R_S ] = define_param(  )

N = 16;%�����D��ɂ���ꍇ��

c = 1.5;% flat window function �̃p�����[�^ delta �̔��萔�Dp.4 4.1 Inner Loop

flatwin_c = 1.2;% flat window function �̑�̑傫�������߂���萔�Dp.4 4.1 Inner Loop

d_c = 0.005;%d �̔��萔�D

l = 4;%L �̔��萔�D

k = 2^(N/2-2);% k
B = 2^(N/2+1);% ���̃f�[�^�𕪊����鐔�D

rs = 1;%���������̃V�[�h

prm_mat = [ N, c, flatwin_c, d_c, l, k, B, rs ];

filename_prm = [num2str(N),num2str(c),num2str(flatwin_c),num2str(d_c),num2str(l),num2str(k),num2str(B),num2str(rs)];% �ݒ肷��p�����[�^�𕶎��Ƃ��ĕۑ��D

rng(rs,'twister');

R_S = rng;
end
