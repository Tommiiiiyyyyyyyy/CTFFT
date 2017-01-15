%関数のテスト用のコードです．
clear

[ W, n, m, delta, eps, epsd, eps_std, w, shift, I] = Make_para_sodapaper();

[ F_M_n ] = F_M( n ,w );
[ IF_M_n ] = IF_M( n, w );

[ std_G, std_G_ft, iv] = Make_std_win_func_soda_01( W, n, shift, F_M_n );

[check_result] = check_std_win_func( std_G_ft, eps_std, delta, n, I)

[ G_ft, G ] = Make_flat_win_func_soda_01( std_G_ft, n, IF_M_n, std_G, m);

[ check_result_fw ] = check_flat_win_func( G_ft, eps, epsd, delta, n, I )

abs_G = abs(G);
abs_G_ft = abs(G_ft);
%このコードで生成されるG,G_ftはflat window function です．