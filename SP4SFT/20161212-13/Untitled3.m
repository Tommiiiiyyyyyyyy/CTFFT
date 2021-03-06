clear

n = 256;
W = 133;
m = 31;

BW = chebwin(W,200);
bw = zeros(n,1);
bw(1:W)=BW(1:W);
bw_ft = fft(bw);
n_bw_ft = bw_ft/bw_ft(1);
n_bw_ft_1 = abs(n_bw_ft);
abs_bw_ft = abs(bw_ft);
n_bw_ft_2 = abs_bw_ft/max(abs_bw_ft);

DC_ft = zeros(n,m);

DC_ft(:,1) = bw_ft;
for i = 2:(m-1)/2
    DC_ft(i:n,i) = bw_ft(1:n-i+1);
    DC_ft(1:i-1,i) = bw_ft(n-i+2:n);
end
DC_ft = DC_ft*ones(m,1);
n_DC_ft = DC_ft/DC_ft(1);
abs_DC_ft = abs(DC_ft);
n_abs_DC_ft = abs_DC_ft/max(abs_DC_ft);