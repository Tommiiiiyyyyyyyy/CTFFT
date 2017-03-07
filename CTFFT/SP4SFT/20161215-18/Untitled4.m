clear

W = 133;
n = 256;
m = 31;
shift = @(x) [zeros(x,n-x),eye(x);eye(n-x),zeros(n-x,x)];

bw = chebwin(W,200);
bw_n = zeros(n,1);
bw_n(1:W) = bw;
bw_n_ft = fft(bw_n);
r_bw_n_ft = real(bw_n_ft);
i_bw_n_ft = imag(bw_n_ft);

c_r_p = (r_bw_n_ft >= 0);
c_r_m = -1*(r_bw_n_ft < 0);
c_r = diag(c_r_p + c_r_m);

c_i_p = (i_bw_n_ft >= 0);
c_i_m = -1*(i_bw_n_ft < 0);
c_i = diag(c_i_p + c_i_m);

abs_r_bw_n_ft = abs(r_bw_n_ft);
abs_i_bw_n_ft = abs(i_bw_n_ft);


BW = zeros(n,m);


BW(:,1) = bw_n_ft;

for i = 1:(m-1)/2
    BW(:,2*i) = shift(i)*bw_n_ft;
    BW(:,2*i+1) = shift(n-i)*bw_n_ft;
    BW_r = real(BW);
    BW_i = imag(BW);
    abs_BW_r = abs(BW_r);
    abs_BW_i = abs(BW_i);
end

BW = BW*ones(m,1);
BW_r = BW_r*ones(m,1);
BW_i = BW_i*ones(m,1);
abs_BW_r = abs_BW_r*ones(m,1);
abs_BW_i = abs_BW_i*ones(m,1);
DCW_ft = complex(c_r*abs_BW_r, c_i*abs_BW_i);
DCW = ifft(DCW_ft);