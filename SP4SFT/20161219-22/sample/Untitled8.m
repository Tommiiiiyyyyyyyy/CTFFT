clear

W = 133;% only odd number
n = 256;% only 2^x number
m = 31;%f*eps

delta = 10^-8;
eps = 0.11;
epsd = 0.06;
eps_std = 1/22;

w = @(x, N) exp(-2i*pi*x/N);
shift = @(x, M) [zeros(x,M-x),eye(x);eye(M-x),zeros(M-x,x)];

F_M = zeros(n+1);
for i = 1:n+1
    for j = 1:n+1
        F_M(i,j) = w((i-(n/2+1))*(j-(n/2+1)) ,n+1);
    end
end
IF_M = zeros(n+1);
for i = 1:n+1
    for j = 1:n+1
        IF_M(i,j) = w(-(i-(n/2+1))*(j-(n/2+1)) ,n+1)/(n+1);
    end
end
std_G = zeros(n+1, 1);

bw = chebwin(W,160);

std_G(1:W) = bw;
std_G = shift((n-W-1)/2+1, n+1)*std_G;

std_G_ft = F_M*std_G;
std_G_ft = std_G_ft/std_G_ft(n/2+1);

abs_G_ft = abs(std_G_ft);
re_G_ft = real(std_G_ft);
im_G_ft = imag(std_G_ft);

std_G = std_G/std_G_ft(n/2+1);

I = @(x)(n/2+1+x);


epsn = floor(eps_std*n);
C_F_eps = zeros(2*epsn + 1,1);
C_F_delta = zeros(n+1 - (2*epsn + 1),1);

C_F_eps = std_G_ft(I(-epsn):I(epsn));

C_F_delta(1:I(-epsn)-1) = abs_G_ft(1:I(-epsn)-1);
C_F_delta(I(-epsn):n+1-(2*epsn + 1)) = abs_G_ft(I(epsn)+1:n+1);

check_result = 'Warnig';
if std_G_ft(I(0)) == 1
    check_result = 'Step1_OK';
end

if min(C_F_eps) > 0
    check_result = 'Step2_OK';
end

if max(C_F_delta) < delta
    check_result = 'ALL_OK';
end



G_ft = zeros(n+1,1);
for i = 1:n+1
    for j = -(m-1)/2:(m-1)/2
        if i+j>0 && i+j<=n+1
            G_ft(i) = G_ft(i) + std_G_ft(i+j);
        elseif i+j <= 0
            G_ft(i) = G_ft(i) + std_G_ft(n+1+(i+j));
        else
            G_ft(i) = G_ft(i) + std_G_ft(i+j-n-1);
        end
    end
end


G_ft = G_ft/max(abs(G_ft));


re_G_ft = real(G_ft);
im_G_ft = imag(G_ft);
abs_G_ft = abs(G_ft);

G = IF_M*G_ft;
G = diag(std_G ~= 0)*G;
re_G = real(G);
im_G = imag(G);
abs_G = abs(G);

