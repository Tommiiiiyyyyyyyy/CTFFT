function [ check_result_fw, check_para ] = check_flatwinfunc( flatwin_ft, flatwin_eps, flatwin_eps_d, flatwin_delta, I, n )
%UNTITLED6 この関数の概要をここに記述
%   詳細説明をここに記述
check_para = 0;
abs_flatwin_ft = abs(flatwin_ft);
epsn = floor(flatwin_eps*n);
epsdn = floor(flatwin_eps_d*n);
C_F_eps_d = zeros(2*epsdn + 1,1);
C_F_delta = zeros(n+1 - (2*epsn + 1),1);

C_F_eps_d = flatwin_ft(I(-epsdn):I(epsdn));

C_F_delta(1:I(-epsn)-1) = abs_flatwin_ft(1:I(-epsn)-1);
C_F_delta(I(-epsn):n+1-(2*epsn + 1)) = abs_flatwin_ft(I(epsn)+1:n+1);

check_result_fw = 'Warnig: flat_winfunc';
if min(C_F_eps_d) > 1-flatwin_delta && max(C_F_eps_d) < 1+flatwin_delta
    check_result_fw = 'Step1_OK: flat_winfunc';
end

if max(C_F_delta) < flatwin_delta
    check_result_fw = 'ALL_OK: flat_winfunc';
    check_para = 1;
end

end

