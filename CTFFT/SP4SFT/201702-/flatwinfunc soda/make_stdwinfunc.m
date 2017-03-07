function [ std_win ] = make_stdwinfunc( flatwin_delta, flatwin_w, flatwin_eps, flatwin_eps_d, n, shift, F_M, IF_M)
%UNTITLED2 この関数の概要をここに記述
%   詳細説明をここに記述
stdwin_delta = (flatwin_eps+flatwin_eps_d)*n/flatwin_delta;

std_win = zeros(n+1, 1);
bw = chebwin(flatwin_w,-20*floor(log10(stdwin_delta)));
std_win(1:flatwin_w) = bw;

std_win = shift((n-flatwin_w-1)/2+1, n+1)*std_win;

std_win_ft = F_M*std_win;
std_win = IF_M*std_win_ft;

std_win = std_win/std_win(n/2+1);
end

