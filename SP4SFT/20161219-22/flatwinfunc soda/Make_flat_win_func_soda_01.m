function [ G_ft, G ] = Make_flat_win_func_soda_01( std_G_ft, n, IF_M, std_G, m)
%Make_flat_win_func_soda_01 standard window function ‚©‚ç flat window
%function ‚ðì¬‚µ‚Ü‚·D
G_ft = zeros(n+1,1);




for i = 1:n+1
    for j = -(m-1)/2:(m-1)/2
        if i+j>0 && i+j<=n+1
            G_ft(i) = G_ft(i) + std_G_ft(i+j);
        elseif i+j <= 0
            G_ft(i) = G_ft(i) + std_G_ft(n+1+(i+j));
        else
            G_ft(i) = G_ft(i) + std_G_ft(i+j-n-1);
        end
    end
end

G_ft = G_ft/max(abs(G_ft));


G = IF_M*G_ft;
G = diag(std_G ~= 0)*G;%supp(G) in [-W/2:W/2]
end

