function [ z, z_ft, I, hash, offset ] = Inner_Loop(n, x, G_n, B, W, d, k)
%Inner_Loop ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q
[ tau, sigma ] = inner_1(n);

[ y ] = inner_2(sigma, tau, x, G);

[z, z_ft] = inner_3(y, B, W);

[ hash, offset ] = inner_4(sigma, n, B );

[ I ] = inner_5( d, k, hash, z_ft );
end

