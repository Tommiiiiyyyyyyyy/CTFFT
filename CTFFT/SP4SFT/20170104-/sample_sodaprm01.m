clear

load G.mat;
load G_ft.mat;
%load x.mat;
load TAU.mat;
load SIGMA.mat;

%x = csvread('x.csv');
absG = abs(G);
absGft = abs(G_ft);

% parameter
n = 256;
W = 133;
B = 16;
delta = 2*10^-9;
k = 4;
d = 1;
L = 8;
dk = d*k;

[ x ] = x_sample( n ); % f_translated vector

%TAU = zeros(L,1);
%SIGMA = zeros(L,1);
I = zeros(n, L);
Z_I = zeros(B, L);

w = @(x)(exp(2*pi*i*x/n));
hash = @(i, j)(round(j*i*B/n)); % j = sigma
offset = @(i, j)(j*i - round(j*i*B/n)*n/B);


for l = 1:L %to get I and gamma in L: Outer Loop 1
% make tau & sigma
%tau = randi(n);
%sigma = 2*randi(n/2) - 1;
%TAU(l) = tau;
%SIGMA(l) = sigma;
tau = TAU(l);
sigma = SIGMA(l);



y = zeros(n,1);
z = zeros(B,1);
I_hash = zeros(n, 1);
for i = 1:n
    sigtau = mod(sigma*i + tau, n);
    sigtau = sigtau + (sigtau == 0)*n;
    y(i) = x(sigtau)*G(i);
    I_hash(i) = hash(i, sigma);
end
for i = 1:B
    for j = 0:floor(W/B) - 1
        z(i) = y(i+j*B);
    end
end
z_ft = fft(z);
Z_I(:,l) = z_ft;
abs_zft = abs(z_ft);
z_mag = sort(abs_zft,'descend');
Z = z_mag(1:dk);

for i = 1:n
    HASH = mod(I_hash(i), B);
    HASH = HASH + (HASH == 0)*B;
    for j = 1:dk
        if abs_zft(HASH) == Z(j)
            I(i, l) = 1;
        end
    end
end

end

S = zeros(n,1);
S = I*ones(L, 1);

I_d = (S >= L/2);

x_hat = zeros(n, L);
for l = 1:L
    for i = 1:n
    if I_d(i) == 1;
        HASH = mod(hash(i, SIGMA(l)), B);
        HASH = HASH + (HASH == 0)*B;
        x_hat(i, l) = Z_I(HASH, l)*w(TAU(l)*i)/G_ft(n/(2*B) + 1+ offset(i, SIGMA(l)));
    end
    end
end

X_hat_d = zeros(n, 1);
for i = 1:n
    if I_d(i) == 1
        X_hat_d(i) = median(x_hat(i,:));
    end
end

absX_hat_d = abs(X_hat_d);
x_ft = fft(x);
absx_ft = abs(x_ft);

n_absX_hat_d = absX_hat_d/max(absX_hat_d);
n_absx_ft = absx_ft/max(absx_ft);

PLOT = [n_absx_ft', n_absX_hat_d];


