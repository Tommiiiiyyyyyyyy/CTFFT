function [ std_G, std_G_ft, iv] = Make_std_win_func_soda_02( W, F_M )
%Make_std_win_func_soda: soda_paper のstandard window function を生成する関数です．
% supp(G)のみを考えるバージョンです．
% std_G: 標準規定の standard window function です．
% std_G_ft: フーリエ基底の standard window function です．
% iv: 添字のベクトルです．
iv = [-(W-1)/2:(W-1)/2]';
std_G = zeros(W, 1);

bw = chebwin(W,160);

std_G = bw;

std_G_ft = F_M*std_G;
std_G_ft = std_G_ft/std_G_ft(n/2+1);%正規化

std_G = std_G/std_G_ft(n/2+1);%正規化
end
