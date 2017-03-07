function [x_o, n, N, w] = CTFFT_prm()
n = 12;
N = 2^n;
x_o = zeros(N,1);

G1 = rand+pi*rand*randn;
G2 = rand+pi*rand*randn;
for j = 1:2:N-1
    x_o(j) = rand*sin(2*pi*G1*j);
    x_o(j+1) = rand*sin(2*pi*G2*j);
end

w = @(x) exp(-2i*pi*x/N);
end

