function [check] = check_delta(G,eps, eps_d, delta, n, W)
% G:Window Function, 
G_ft = fft(G);
ABS_G_ft = abs(G_ft);
n_eps = ceil(n*eps);
n_eps_d = floor(n*eps_d);

l = numel(G);

G_eps = ABS_G_ft(n_eps:l-n_eps+1);
G_eps_d = [G_ft(1:n_eps_d);G_ft(l-n_eps_d+1:l)];

C_esp = (G_eps >= delta);
C_esp_d = (G_eps_d < 1-delta || G_eps_d > 1+delta);

if (ones(1,l)*C_esp) && (ones(1,l)*C_esp_d)
    check = 1
else
    check = 0
end
end

% 窓関数を作る時点で，窓関数のサイズのチェックをかけるので，サポートのサイズ判定はしていません．
