function [check_result] = check_std_win_func( std_win_ft, eps_std, delta, n, I)
%check_std_win_func flat window function ‚ð\¬‚·‚é standard window function
%‚ªðŒ‚ð–ž‚½‚·‚©’²‚×‚éŠÖ”‚Å‚·Dsupp(G)‚É‚Â‚¢‚Ä‚ÍÈ—ª‚µ‚Ä‚¢‚Ü‚·D
abs_G_ft = abs(std_win_ft);
epsn = floor(eps_std*n);
C_F_eps = zeros(2*epsn + 1,1);
C_F_delta = zeros(n+1 - (2*epsn + 1),1);

C_F_eps = std_win_ft(I(-epsn):I(epsn));

C_F_delta(1:I(-epsn)-1) = abs_G_ft(1:I(-epsn)-1);
C_F_delta(I(-epsn):n+1-(2*epsn + 1)) = abs_G_ft(I(epsn)+1:n+1);

check_result = 'Warnig: stad_winfunc';
if std_win_ft(I(0)) == 1 
    check_result = 'Step1_OK: stad_winfunc';
end

if min(C_F_eps) > 0
    check_result = 'Step2_OK: stad_winfunc';
end

if max(C_F_delta) < delta
    check_result = 'ALL_OK: stad_winfunc';
end
end



