clear

W = 133;
n = 256;
m = 31;

bw = chebwin(W,200);
bw_n = zeros(n,1);
bw_n(1:W) = bw;

bw_ft = fft(bw);
bw_n_ft = fft(bw_n);
abs_bw_n_ft = abs(bw_n_ft);
DCW = zeros(n,1);
shift = @(x) [zeros(x,n-x),eye(x);eye(n-x),zeros(n-x,x)];
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
abs_bwn = abs_bwn*ones(m,1);

abs_BW_r = abs(BW_r)*ones(m,1);

