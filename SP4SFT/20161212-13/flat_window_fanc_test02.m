clear

n = 256;
W = 133;
m = 31;

bw = chebwin(W,200);
bw_ft = fft(bw);
n_bw_ft = bw_ft/bw_ft(1);
n_bw_ft_1 = abs(n_bw_ft);
abs_bw_ft = abs(bw_ft);
n_bw_ft_2 = abs_bw_ft/max(abs_bw_ft);

DC_ft = zeros(W,m);
DC_ft(:,1) = bw_ft;

shift_i = @(i) [zeros(i,W-i),eye(i);eye(W-i),zeros(W-i,i)];

for i = 1:(m-1)/2
    S_DC = shift_i(i)*bw_ft;
    R_S_DC = zeros(W,1);
    R_S_DC(1:W) = S_DC(W:-1:1);
    DC_ft(:,i+1) = S_DC;
    DC_ft(:,m-i+1) = R_S_DC;
end
plot(abs(DC_ft))
abs_DC_ft1 = abs(DC_ft)*ones(m,1);
DC_ft = DC_ft*ones(m,1);
re_DC_ft = real(DC_ft);
%n_DC_ft = DC_ft/DC_ft(1);
abs_DC_ft2 = abs(DC_ft);
n_abs_DC_ft = abs_DC_ft2/max(abs_DC_ft2);
