function [ flatwin, flatwin_ft ] = make_flatwinfunc( flatwin_w, std_win_ft, n, flatwin_eps_d, flatwin_f)
%UNTITLED4 この関数の概要をここに記述
%   詳細説明をここに記述
W = ceil(-n*(flatwin_eps_d+flatwin_f)):floor(n*(flatwin_eps_d+flatwin_f));
flatwin_ft = zeros(n,1);

for j =1:numel(W)
        flatwin_ft = flatwin_ft + std_win_ft(mod((1:n) + W(j), n) + (n)*(mod((1:n) + W(j), n) == 0));
end



%for i = 1:n+1
%    for j = ceil(-n*(flatwin_eps_d+flatwin_f)):floor(n*(flatwin_eps_d+flatwin_f))
%        if i+j>0 && i+j<=n+1
%            flatwin_ft(i) = flatwin_ft(i) + std_win_ft(i+j);
%        elseif i+j <= 0
%           flatwin_ft(i) = flatwin_ft(i) + std_win_ft(n+1+(i+j));
%        else
%            flatwin_ft(i) = flatwin_ft(i) + std_win_ft(i+j-n-1);
%        end
%    end
%end

flatwin_ft = flatwin_ft/max(abs(flatwin_ft));

flatwin = ifft(flatwin_ft);

flatwin((flatwin_w+1)/2+1:end-(flatwin_w-1)/2) = 0;

end

