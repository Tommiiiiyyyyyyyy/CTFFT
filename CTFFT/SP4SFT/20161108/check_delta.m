function [messe_win] = check_delta(G, eps, eps_d, delta, n)
% G:Window Function, 
G_ft = FFT(G);
ABS_G_ft = abs(G_ft);
p_epsn = ceil(n*eps);
m_epsn = n - ceil(n*eps);
p_epsn_d = floor(n*eps_d);
m_epsn_d = n - floor(n*eps_d);

ABS_G_eps = ABS_G_ft(p_epsn:m_epsn);
ABS_G_eps_d = [ABS_G_ft(1:p_epsn_d);ABS_G_ft(m_epsn_d:numel(G))];

CM_eps = (ABS_G_eps < delta);
CM_eps_d = (ABS_G_eps_d > 1-delta & ABS_G_eps_d > 1+delta);

if (CM_eps == 0) | (CM_eps_d == 0)
    warning('G is NOT flat window function')
else
    messe_win = 'window function is OK'
end

end
% 窓関数を作る時点で，窓関数のサイズのチェックをかけるので，サポートのサイズ判定はしていません．
