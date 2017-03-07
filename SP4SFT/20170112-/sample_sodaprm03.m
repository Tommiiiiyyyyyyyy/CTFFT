clear

load G.mat;
load G_ft.mat;
%G_ft = fft(G);
%load x.mat;
%load TAU.mat;
%load SIGMA.mat;

%x = csvread('x.csv');


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
%[ x ] = make_test_x( n )
%x = G';

TAU = zeros(L,1);
SIGMA = zeros(L,1);
I = zeros(n, L);
Z_I = zeros(B, L);

w = @(x)(exp(2*pi*1i*x/n));
hash = @(x, y)(round(x*y*B/n)); % y = sigma
offset = @(x, y)(y*x - round(y*x*B/n)*n/B);
shift = @(x, M) [zeros(x,M-x),eye(x);eye(M-x),zeros(M-x,x)];

w_d = @(x, N) exp(-2i*pi*x/N);

[ F_M_n ] = F_M( n-1 ,w_d );
[ F_M_n_B ] = F_M( B-1 ,w_d );
[ IF_M_n ] = IF_M( n-1, w_d );

%x = (shift(127, 256)*x')';
%x = (shift(127, 256)*x);

%G = shift(127, 256)*G(1:end-1);
%G = G(2:end);
%G_ft = shift(127, 256)*G_ft(1:end-1);
%G_ft = G_ft(2:end);
%G = shift(189, n)*G;
%G_ft = F_M_n*G;
%G_ft = fft(G);

absG = abs(G);
absGft = abs(G_ft);

for l = 1:L %to get I and gamma in L: Outer Loop 1
% make tau & sigma
tau = randi(n);
sigma = 2*randi(n/2) - 1;
TAU(l) = tau;
SIGMA(l) = sigma;
tau = TAU(l);
sigma = SIGMA(l);



y = zeros(n,1);
z = zeros(B,1);
I_hash = zeros(n, 1);
for k = 1:n
    sigtau = mod(sigma*k + tau, n);
    sigtau = sigtau + (sigtau == 0)*n;
    y(k) = x(sigtau)*G(k);
    I_hash(k) = hash(k, sigma);
end
for k = 1:B
    for j = 0:floor(W/B) - 1
        z(k) = z(k) + y(k+j*B);
    end
end
Z_I(:,l) = fft(z);
abs_zft = abs(Z_I(:,l));
z_mag = sort(abs_zft,'descend');
Z = z_mag(1:dk);
Z_a = zeros(dk,1);

for k = 1:dk
    point = find(abs_zft == Z(k));
    Z_a(k) = point(1);
    abs_zft(Z_a(k)) = 0;
end


for k = 1:n
    HASH = mod(I_hash(k), B);
    HASH = HASH + (HASH == 0)*B;
    for j = 1:dk
        if HASH == Z_a(j)
            I(k, l) = 1;
            %abs_zft(HASH) = 0;
        end
    end
end

end

S = zeros(n,1);
S = I*ones(L, 1);

I_d = (S >= L/2);

x_hat = zeros(n, L);
for l = 1:L
    for k = 1:n
    if I_d(k) == 1;
        HASH = mod(hash(k, SIGMA(l)), B);
        HASH = HASH + (HASH == 0)*B;
        x_hat(k, l) = Z_I(HASH, l)*w(TAU(l)*k)/G_ft(n/(2*B) + 1 + offset(k, SIGMA(l)));
    end
    end
end

X_hat_d = zeros(n, 1);
for k = 1:n
    if I_d(k) == 1
        X_hat_d(k) = complex(median(real(x_hat(k,:))), median(imag(x_hat(k,:))));
        %X_hat_d(i) = mean(x_hat(i,:));
    end
end

absX_hat_d = abs(X_hat_d);
x_ft = fft(x);
absx_ft = abs(x_ft);

n_absX_hat_d = absX_hat_d/max(absX_hat_d);
n_absx_ft = absx_ft/max(absx_ft);

PLOT = [n_absx_ft', n_absX_hat_d];
%PLOT = [n_absx_ft, n_absX_hat_d];

x_ft2 = absx_ft/n;
x_ft1 = x_ft2(1:n/2+1);
x_ft1(2:end-1) = 2*x_ft1(2:end-1);

X_hat_d2 = absX_hat_d/n;
X_hat_d1 = X_hat_d2(1:n/2+1);
X_hat_d1(2:end-1) = 2*X_hat_d1(2:end-1);

PLOT2 = [x_ft1'/max(x_ft1), X_hat_d1/max(X_hat_d1)];
%PLOT2 = [x_ft1/max(x_ft1), X_hat_d1/max(X_hat_d1)];

f = n*(0:(n/2))/n;
plot(PLOT)
%plot(f, PLOT2)

