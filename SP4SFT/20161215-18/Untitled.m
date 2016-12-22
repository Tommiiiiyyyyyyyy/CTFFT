clear

W = 133;
n = 256;
m = 31;

w = @(x, N) exp(-2i*pi*x/N);
shift = @(x, M) [zeros(x,M-x),eye(x);eye(M-x),zeros(M-x,x)];

bw = chebwin(W,200);
BW = zeros(n,1);
BW(1:W) = bw;
bw_ft = abs(fft(BW));

DCW_ft = zeros(n,1);

b = [bw_ft(1:14);bw_ft(n-12:n)];
numel(b)
b = ones(1,numel(b))*b;
d = zeros(W,1);
for i = 1:n
    if i <= (m+1)/2
        a = [bw_ft(1:i+(m-1)/2);bw_ft(n - (-i+(m-1)/2):n)];
        d(i) = numel(a);
        a = ones(1,numel(a))*a;
    elseif i <= n - (m+1)/2
        a = bw_ft(i-(m-1)/2:i+(m-1)/2);
        d(i) = numel(a);
        a = ones(1,numel(a))*a;
    else
        a = [bw_ft(1:-1+m-(n-(i-(m-1)/2)));bw_ft(i-(m-1)/2:n)];
        d(i) = numel(a);
        a = ones(1,numel(a))*a;
    end
    
    DCW_ft(i) = (a)/(b);
end
abs_DCW_ft = abs(DCW_ft);
DCW = ifft(DCW_ft);
abs_DCW = abs(DCW);