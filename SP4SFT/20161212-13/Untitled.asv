n = 256;
W = 133;
m = 31;

g = chebwin(W,200);


G = zeros(n,m);

A = zeros(W,m);

A(:,(m+1)/2) = g;

for i = 1:(m+1)/2-1
    A(i+1:W,i) = g(i+1:W)*g(i+(W+1)/2);
    A(1:W-i,m-i+1) = A(W:-1:i+1,i);
end

G(1:W,1:m) = A(1:W,1:m);

G = G*ones(m,1);
%G = G*g((W+1)/2-(m-1)/2:(W+1)/2+(m-1)/2);
G_ft = fft(G);
n_G_ft = G_ft/max(G_ft);
abs_G = abs(G_ft);
n_G_abs = abs_G/max(abs_G);


eps = 0.11;
eps_d = 0.06;
delta = 2*10^-9;


