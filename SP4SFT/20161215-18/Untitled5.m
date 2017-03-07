clear

W = 133;
n = 256;
m = 31;

esp = 0.11;
eps_d = 0.06;

shift = @(x) [zeros(x,W-x),eye(x);eye(W-x),zeros(W-x,x)];

edn = floor(eps_d*n);

DCW_ft= zeros(n, 1);
DCW_ft(1:edn) = 1;
DCW_ft(W-edn+1:W) = 1;
w = numel(find(DCW_ft == 0));
bw = zeros(w,1);
bw(1:W) = chebwin(W,100);
bw_ft = fft(bw);

DCW_ft(edn+1:-edn) = bw_ft/max(bw_ft);
DCW = ifft(DCW_ft);
DCW = shift((W+1)/2)*DCW;