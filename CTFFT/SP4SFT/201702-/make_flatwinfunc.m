function [ flatwin, flatwin_ft ] = make_flatwinfunc( std_win, std_win_ft, n, IF_M, flatwin_eps_d, flatwin_f)
%UNTITLED4 この関数の概要をここに記述
%   詳細説明をここに記述

flatwin_ft = zeros(n+1,1);

for i = 1:n+1
    for j = ceil(-n*(flatwin_eps_d+flatwin_f)):floor(n*(flatwin_eps_d+flatwin_f))
        if i+j>0 && i+j<=n+1
            flatwin_ft(i) = flatwin_ft(i) + std_win_ft(i+j);
        elseif i+j <= 0
            flatwin_ft(i) = flatwin_ft(i) + std_win_ft(n+1+(i+j));
        else
            flatwin_ft(i) = flatwin_ft(i) + std_win_ft(i+j-n-1);
        end
    end
end

flatwin_ft = flatwin_ft/max(abs(flatwin_ft));
flatwin = IF_M*flatwin_ft;
flatwin = diag(std_win ~= 0)*flatwin;

end

