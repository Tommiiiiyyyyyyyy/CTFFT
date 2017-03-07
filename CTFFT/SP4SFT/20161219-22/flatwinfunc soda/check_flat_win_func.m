function [ check_result_fw ] = check_flat_win_func( G_ft, eps, epsd, delta, n, I )
%check_flat_win_func flat window functio‚ªðŒ‚ð–ž‚½‚·‚©’²‚×‚éŠÖ”‚Å‚·Dsupp(G)‚É‚Â‚¢‚Ä‚ÍÈ—ª‚µ‚Ä‚¢‚Ü‚·D
abs_G_ft = abs(G_ft);
epsn = floor(eps*n);
epsdn = floor(epsd*n);
C_F_eps_d = zeros(2*epsdn + 1,1);
C_F_delta = zeros(n+1 - (2*epsn + 1),1);

C_F_eps_d = G_ft(I(-epsdn):I(epsdn));

C_F_delta(1:I(-epsn)-1) = abs_G_ft(1:I(-epsn)-1);
C_F_delta(I(-epsn):n+1-(2*epsn + 1)) = abs_G_ft(I(epsn)+1:n+1);

check_result_fw = 'Warnig: flat_winfunc';
if min(C_F_eps_d) > 1-delta && max(C_F_eps_d) < 1+delta
    check_result_fw = 'Step1_OK: flat_winfunc';
end

if max(C_F_delta) < delta
    check_result_fw = 'ALL_OK: flat_winfunc';
end
end

