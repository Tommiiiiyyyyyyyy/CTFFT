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
DCWd = ifft(DCW_ft);
abs_DCWd = abs(DCWd);
win_t = ones(n,1);
win_t((W+1)/2+1:n-(W-1)/2) = 0;
win_t = diag(win_t);
DCW = win_t*DCWd;
abs_DCW = abs(DCW);
DCW_ft_2 = fft(DCW);
abs_DCW_ft_2 = abs(DCW_ft_2);
re_DCW_ft_2 = real(DCW_ft_2);



A = chebwin(W,200);
B = fft(A);
C = real(B);
D = imag(B);
E = abs(B);
F = ifft(B);
AA = (C < 0);
Aa = (C > 0);
AB = -1*AA;
AC = AB+Aa;
AD = diag(AC)*C;
AE = diag(AC)*B;
AF = abs(AE);
BA = ifft(AE);
BB = ifft(B);
BC = shift((W-1)/2,W)*A;
BD = fft(BC);
BE = abs(BD);
BF = fft(BA);
CA = abs(BF);
CB = real(BF);
CC = shift((W+1)/2,W)*BA;
CD = fft(CC);
CE = real(CD);
CF = abs(CE);

DA = ifftshift(CD);
DB = abs(DA);
DC = ifftshift(A);
DE = abs(DC);