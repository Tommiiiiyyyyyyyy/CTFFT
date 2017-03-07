n = 256;
W = 133;
m = 31;

g = chebwin(W,500);


G = zeros(n,m);

A = zeros(W,m);

A(:,m) = g;

for i = 1:(m-1)/2
    A(3*i+1:W,i) = g(3*i+1:W)*g((W+1)/2+3*i);
    A(1:W-3*i,m-i) = A(W:-1:3*i+1,i);
end

G(1:W,1:m) = A(1:W,1:m);

G = G*ones(m,1);
G_ft = fft(G);
abs_G = abs(G_ft);
n_G_abs = abs_G/max(abs_G);