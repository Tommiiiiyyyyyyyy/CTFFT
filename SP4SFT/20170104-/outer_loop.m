function [ X_d ] = outer_loop( n, L, x, G, B, W, d, k, G_ft )
%outer_loop ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q
[ I ] = outer_1( n, L, x, G, B, W, d, k );

[ s ] = outer_2( I, n, L );

[ I_d ] = outer_3( s, n, L );

[ x_Id ] = outer_4( I_d, z_ft, G_ft, w, hash, sigma, offset, tau );

[ X_d ] = outer_5( I_d, x_Id ):

end