% 2^n要素のベクトルのフーリエ基底から，要素[l + (0:n-k-1)*2^k (k<n, 1=<l=<2^k)]を間引きし，間引きされたフーリエ基底，
%間引きしたフーリエ基底，それぞれの逆変換後の標準基底，標準基底の差を出力する関数．
%FFTのアルゴリズムは，MATLABの組み込み関数を使用しています．

function [x_std_d, x_d, x_ft_d, x_ft, x_ft_ded, x_std_ded] = DELET_BuiltinFFT(x_std, N, k, l)
x_ft = ftt(x_std);

V_DELET = ones(N,1);
V_DELETED = zeros(N,1);

V_DELET(l:2^k:N) = 0;
V_DELETED(l:2^k:N) = 1;

M_DELET = diag(V_DELET);
M_DELETED = diag(V_DELETED);

x_ft_d = M_DELET*x_ft;
x_ft_ded = M_DELETED*x_ft;

x_std_d = ifft(x_ft_d);
x_std_ded = ifft(x_ft_ded);
x_d = x_std - x_std_d;
end