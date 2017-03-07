clear

n = 256;
W = 133;
m = 31;

BW = chebwin(W,80);
bw = zeros(n,1);
bw(1:W)=BW(1:W);
bw_ft = fft(bw);
abs_bw_ft = abs(bw_ft);
n_bw_ft = abs_bw_ft/max(abs_bw_ft);

DC_ft = zeros(n,m);
DC_ft(:,1) = bw_ft;

shift_i = @(i) [zeros(i,n-i),eye(i);eye(n-i),zeros(n-i,i)];

for i = 1:(m-1)/2
    S_DC = shift_i(i)*bw_ft;
    R_S_DC = zeros(n,1);
    R_S_DC(1:n) = DC_ft(n:-1:1,i);
    DC_ft(:,i+1) = S_DC;
    DC_ft(:,m-i+1) = R_S_DC;
end
%plot(abs(DC_ft))
abs_DC_ft1 = abs(DC_ft)*ones(m,1);
DC_ft = DC_ft*ones(m,1);
re_DC_ft = real(DC_ft);
%n_DC_ft = DC_ft/DC_ft(1);
abs_DC_ft2 = abs(DC_ft);
n_abs_DC_ft = abs_DC_ft2/max(abs_DC_ft2);
n_DC_ft = DC_ft/max(abs_DC_ft2);