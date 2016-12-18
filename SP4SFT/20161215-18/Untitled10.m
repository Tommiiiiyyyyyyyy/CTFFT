clear

W = 133;
n = 256;
m = 31;

w = @(x, N) exp(-2i*pi*x/N);
shift = @(x, M) [zeros(x,M-x),eye(x);eye(M-x),zeros(M-x,x)];

bw = chebwin(W,90);

bw_ft = fft(bw);

DCW_ft = zeros(W,1);

b = [bw_ft(1:14);bw_ft(W-12:W)];
numel(b)
b = ones(1,numel(b))*b;
d = zeros(W,1);
for i = 1:W
    if i <= (m+1)/2
        a = [bw_ft(1:i+(m-1)/2);bw_ft(W - (-i+(m-1)/2):W)];
        d(i) = numel(a);
        a = ones(1,numel(a))*a;
    elseif i <= W - (m+1)/2
        a = bw_ft(i-(m-1)/2:i+(m-1)/2);
        d(i) = numel(a);
        a = ones(1,numel(a))*a;
    else
        a = [bw_ft(1:-1+m-(W-(i-(m-1)/2)));bw_ft(i-(m-1)/2:W)];
        d(i) = numel(a);
        a = ones(1,numel(a))*a;
    end
    
    DCW_ft(i) = (a)/(b);
end
abs_DCW_ft = abs(DCW_ft);
