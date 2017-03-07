clear

[x_st, N, n, w] = CTFFT_prm();
b = 4;
B = 2^b;

d = 1;
k = 4;

c = 3;

W = 24*B;

G = chebwin(W+1,10*log10(n^c));
G_hat = fft(G);

L = round(log(n));

I = zeros(d*k*n/B,L);
x_hat = zeros(d*k*n/B,L);

for M = 1:L



y = zeros(W,1);

J = zeros(d*k,1);
    
sigma_max = floor((n-1)/(W-1));
sigma = 2*randi((sigma_max + (mod(sigma_max, 2) == 1))/2) - 1; % sigma is odd number.
tau = randi(n - sigma*(W-1)); 

for i = 1:W
    y(i) = G(i)*x_st(tau+sigma*(i-1));
end


z = zeros(B,1);

for i = 1:B
    for j = 0:W/B-1
        z(i) = z(i) + y(i+j*B);
    end
end

z_hat = fft(z);
abs_z = abs(z_hat);
h_sigma = @(i) round(sigma*i*B/n);% hash function
o_sigma = @(i) sigma*i - h_sigma(i)*n/B; % offset

% start Location loop
Z = sort(abs_z,'descend');
z_c = zeros(B,1);
dk_1 = 0;
for i = 1:d*k
    clear F
    F = find(abs_z == Z(dk_1+1));
    J(dk_1+1:dk_1+numel(F),1) = F;
    dk_1 = dk_1 + numel(F);
    
    if dk_1 >= d*k
        break
    end
end


I_hash = h_sigma(1:n);
D = zeros(n,1);
for i = 1:d*k
    D = D + (I_hash' == J(i));
end
I(:,M) = find(D);
for i = 1:k*d*n/B
    x_hat(i,M) = z_hat(h_sigma(I(i,M)))*w(tau*I(i,M))/G_hat(o_sigma(I(i,M)));
end


end
I_u = I(:,1);
for i = 2:L
    I_u = union(I_u,I(:,2));
end
