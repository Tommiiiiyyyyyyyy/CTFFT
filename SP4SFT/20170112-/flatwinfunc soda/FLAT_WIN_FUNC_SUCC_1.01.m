%FLAT WINDOW FUNCTION Š®‘S”Å
clear

[ W, n, m, delta, eps, epsd, eps_std, w, shift, I] = Make_para_sodapaper();

C = @(x)cos(2*pi*x/n);

[ F_M_n ] = F_M( n ,w );
[ IF_M_n ] = IF_M( n, w );

[ std_G, std_G_ft, iv] = Make_std_win_func_soda_01( W, n, shift, F_M_n );

[check_result] = check_std_win_func( std_G_ft, eps_std, delta, n, I)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sum = zeros(1+n, 1);
sum(1:1+(m-1)/2) = 1;
sum(n+2-(m-1)/2:n+1) = 1;
SUM = zeros(n+1);
for i = 2:n
    if i >= n/2 + 1 - (W-1)/2 && i <= n/2 + 1 + (W-1)/2
        SUM(i, :) = (shift(i-1, n+1)*sum)';
    end
end
SUM(:,1:n/2 - (W-1)/2) = 0;
SUM(:,n/2 + (W-1)/2:n+1) = 0;


FLAT = IF_M_n*SUM*F_M_n;

G_ft = SUM*F_M_n*std_G;
nG = max(abs(G_ft));
G_ft = G_ft/nG;

G = FLAT*std_G/nG;
G = real(G);
G(1:n/2 - (W-1)/2-1) = 0;
G(n/2 + (W-1)/2+1:n+1) = 0;
G_ft = F_M_n*G;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[ check_result_fw ] = check_flat_win_func( G_ft, eps, epsd, delta, n, I )

abs_G = abs(G);
abs_G_ft = abs(G_ft);