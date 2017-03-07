clear

W = 133;
n = 256;
m = 31;

w = @(x) exp(-2i*pi*x/n);
shift = @(x) [zeros(x,n-x),eye(x);eye(n-x),zeros(n-x,x)]*w(x);

bw = chebwin(W,100);

BW = zeros(n,1);
BW(1:W) = bw;

BW_ft = fft(BW);

DCW_ft = zeros(n,m);
DCW_ft(:,1) = BW_ft;

for j = 1:(m-1)/2
    DCW_ft(:,2*j) = shift(j)*BW_ft;
    DCW_ft(:,2*j+1) = shift(n-j)*BW_ft;
end

plot(abs(DCW_ft))
DCW_ft = DCW_ft*ones(m,1);
abs_DCW_ft = abs(DCW_ft);

a = ifft(BW_ft);