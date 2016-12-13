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


DC_ft = bw_ft;

shift_i = @(i) [zeros(i,n-i),eye(i);eye(n-i),zeros(n-i,i)];

for i = 1:(m-1)/2
    S_DC = shift_i(i)*bw_ft;
    R_S_DC = zeros(n,1);
    R_S_DC(1:n) = S_DC(n:-1:1);
    DC_ft = DC_ft + S_DC + R_S_DC;
end

%n_DC_ft = DC_ft/DC_ft(1);
abs_DC_ft = abs(DC_ft);
n_abs_DC_ft = abs_DC_ft/max(abs_DC_ft);

