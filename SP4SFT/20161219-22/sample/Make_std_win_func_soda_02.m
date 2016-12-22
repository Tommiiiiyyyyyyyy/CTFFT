function [ std_G, std_G_ft, iv] = Make_std_win_func_soda_02( W, F_M )
%Make_std_win_func_soda: soda_paper ��standard window function �𐶐�����֐��ł��D
% supp(G)�݂̂��l����o�[�W�����ł��D
% std_G: �W���K��� standard window function �ł��D
% std_G_ft: �t�[���G���� standard window function �ł��D
% iv: �Y���̃x�N�g���ł��D
iv = [-(W-1)/2:(W-1)/2]';
std_G = zeros(W, 1);

bw = chebwin(W,160);

std_G = bw;

std_G_ft = F_M*std_G;
std_G_ft = std_G_ft/std_G_ft(n/2+1);%���K��

std_G = std_G/std_G_ft(n/2+1);%���K��
end
