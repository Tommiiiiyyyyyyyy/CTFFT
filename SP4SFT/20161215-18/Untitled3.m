clear

W = 133;
n = 256;
m = 31;

bw = chebwin(W,80);




bw_ft = fft(bw);
bw_ft = SHIFT*bw_ft;

re_bw = real(bw_ft);
im_bw = imag(bw_ft);


shift = @(x) [zeros(x,W-x),(-1)^x*eye(x);(-1)^x*eye(W-x),zeros(W-x,x)];


DC_ft = zeros(W,m);
DC_ft(:,1) = bw_ft;

for i = 1:(m-1)/2
    S_DC(1:W) = shift(i)*bw_ft;
    R_S_DC = zeros(W,1);
    R_S_DC(1:W) = S_DC(W:-1:1);
    DC_ft(:,i+1) = S_DC;
    DC_ft(:,m-i+1) = R_S_DC;
end

DC_FT = DC_ft*ones(m,1);
abs_DC_FT = abs(DC_FT);