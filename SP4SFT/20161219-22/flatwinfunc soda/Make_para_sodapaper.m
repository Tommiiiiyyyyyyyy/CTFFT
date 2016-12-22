function [ W, n, m, delta, eps, epsd, eps_std, w, shift, I] = Make_para_sodapaper()
%Make_para_sodapaper 
%  soda_paper のパラメータをまとめた関数です．
W = 133;% only odd number
n = 256;% only 2^x number
m = 31;%f*eps

delta = 10^-8;
eps = 0.11;
epsd = 0.06;
eps_std = 1/22;

w = @(x, N) exp(-2i*pi*x/N);
shift = @(x, M) [zeros(x,M-x),eye(x);eye(M-x),zeros(M-x,x)];
I = @(x)(n/2+1+x);
end

