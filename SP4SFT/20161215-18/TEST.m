clear

W = 133;
n = 256;
m = 31;

bw = chebwin(W,300);
bw_ft = fft(bw);
DCW = zeros(n,1);
shift = @(x) [zeros(x,W-x),eye(x);eye(W-x),zeros(W-x,x)];

BW = zeros(W,m);
BW(:,1) = bw_ft;

for i = 1:(m-1)/2
    BW(:,2*i) = shift(i)*bw_ft;
    BW(:,2*i+1) = shift(W-i)*bw_ft;
    BW_r = real(BW);
    BW_i = imag(BW);
end

BW = BW*ones(m,1);

abs_BW_r = abs(BW_r)*ones(m,1);
abs_BW_i = abs(BW_i)*ones(m,1);
BW_r = BW_r*ones(m,1);
BW_i = BW_i*ones(m,1);

DCW_ft = complex(abs_BW_r, BW_i);
abs_DCW_ft = abs(DCW_ft);
n_abs_DCW_ft = abs_DCW_ft/max(abs_DCW_ft);
DCW = abs(ifft(DCW_ft/max(abs_DCW_ft)));
