clear

W = 133;
n = 256;
m = 31;

esp = 0.11;
eps_d = 0.06;

bw =  chebwin(W-m+1,100);

shift = @(x) [zeros(x,W-x),eye(x);eye(W-x),zeros(W-x,x)];

BW = zeros(W,m);
BW((m+1)/2:(m+1)/2+W-m,1) = bw;

for i = 1:(m-1)/2
    BW(:,2*i) = BW((W+1)/2+i,1)*shift(i)*BW(:,1);
    BW(:,2*i+1) = BW((W+1)/2-i,1)*shift(W-i)*BW(:,1);
end
BW = BW*ones(m,1);
DCW = zeros(n,1);
DCW(1:W) = BW;
DCW_ft = fft(DCW);
abs_DCW_ft = abs(DCW_ft);