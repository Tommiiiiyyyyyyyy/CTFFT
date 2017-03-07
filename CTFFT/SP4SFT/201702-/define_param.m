function [ N, N_h, n, n_h, B, omega, shift, k, d, dk, flatwin_eps, flatwin_eps_d, flatwin_f, flatwin_delta, flatwin_w, I, L ] = define_param(  )
%SFTを行うために必要な各種パラメータを設定する関数です．

N = 14;%偶数
N_h = N/2;

n = 2^N;%計算するベクトルの長さ
n_h = 2^N_h;



omega = @(x, y)exp(2i*pi*x/y);
shift = @(x, M) [zeros(x,M-x),eye(x);eye(M-x),zeros(M-x,x)];

k = 2^(N_h-1);

B = 2^(N_h+1);%ベクトルの分割数，重要

c = 2;%deltaの累乗定数
flatwin_eps = 1/B;
flatwin_eps_d = flatwin_eps/2;
flatwin_f = (flatwin_eps - flatwin_eps_d)/2;
flatwin_delta = n^(-c);
flatwin_c = 1;%窓関数の台の幅の比例定数
flatwin_w = round(flatwin_c*B*log(n/flatwin_delta));%窓関数の台の幅
flatwin_w = flatwin_w + (mod(flatwin_w, 2) == 0);%flatwin_w: must be  an odd number
I = @(x)(n/2+1+x);

d_c = 0.01;%dの比例定数
d = round(d_c/flatwin_eps);
dk = d*k;

l = 3;%Lの比例定数，重要
L = round(l*log(n));
end
