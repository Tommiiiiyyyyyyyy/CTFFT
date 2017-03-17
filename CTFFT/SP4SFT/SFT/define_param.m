function [ N, c, flatwin_c, d_c, l, k, B, prm_mat, filename_prm, R_S ] = define_param(  )

N = 16;%偶数．奇数にする場合は

c = 1.5;% flat window function のパラメータ delta の比例定数．p.4 4.1 Inner Loop

flatwin_c = 1.2;% flat window function の台の大きさを決める比例定数．p.4 4.1 Inner Loop

d_c = 0.005;%d の比例定数．

l = 4;%L の比例定数．

k = 2^(N/2-2);% k
B = 2^(N/2+1);% 元のデータを分割する数．

rs = 1;%乱数生成のシード

prm_mat = [ N, c, flatwin_c, d_c, l, k, B, rs ];

filename_prm = [num2str(N),num2str(c),num2str(flatwin_c),num2str(d_c),num2str(l),num2str(k),num2str(B),num2str(rs)];% 設定するパラメータを文字として保存．

rng(rs,'twister');

R_S = rng;
end
