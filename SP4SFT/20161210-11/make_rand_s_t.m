function [sigma, tau, sigma_tau] = make_rand_s_t(n, W)
%UNTITLED6 ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q
sigma = randi(n/2)*2-1;
tau = randi(n);

mod_ts_w = @(i) mod(tau + i*sigma ,W);
sigma_tau = mod_ts_w(1:W)+w*(mod_ts_w(1:W) == 0);

end

