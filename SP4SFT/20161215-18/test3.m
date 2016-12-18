clear

W = 133;
n = 256;
m = 31;

w = @(x) exp(-2i*pi*x/n);

shift = @(x) [zeros(x,n-x),eye(x);eye(n-x),zeros(n-x,x)];

bw = chebwin(W,80);
bw_n = zeros(n,1);
bw_n(1:W) = bw;
bw_ft = fft(bw);
bw_n_ft = fft(bw_n);
abs_bw_n_ft = abs(bw_n_ft);
b0 = abs(fft(bw_n));
b10 = abs(fft(shift(10)*bw_n));

abs_bwn = zeros(n,m);
BW = zeros(n,m);
abs_bwn(:,1) = abs_bw_n_ft;
BW(:,1) = bw_n_ft;

for i = 1:(m-1)/2
    abs_bwn(:,2*i) = shift(i)*abs_bw_n_ft;
    abs_bwn(:,2*i+1) = shift(n-i)*abs_bw_n_ft;
    BW(:,2*i) = shift(i)*bw_n_ft;
    BW(:,2*i+1) = shift(n-i)*bw_n_ft;
    BW_r = real(BW);
    BW_i = imag(BW);
end

BW = BW*ones(m,1);
BW_r = BW_r*ones(m,1);
BW_i = BW_i*ones(m,1);
