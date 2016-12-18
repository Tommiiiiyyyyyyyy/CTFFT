clear

W = 133;
n = 256;
m = 31;

w = @(x, N) exp(-2i*pi*x/N);
shift = @(x, M) [zeros(x,M-x),eye(x);eye(M-x),zeros(M-x,x)];

bw = chebwin(W,90);

BW = zeros(1,m);

for i = 1:m
    BW(i) = w(i-(m+1)/2, n);
end
DCW = zeros(n,1);
DCW(1:W) = bw*(BW*ones(m,1));
abs_DCW = abs(DCW);
DCW_ft = fft(DCW);
n_abs_DCW_ft = abs(DCW_ft)/max(abs(DCW_ft));