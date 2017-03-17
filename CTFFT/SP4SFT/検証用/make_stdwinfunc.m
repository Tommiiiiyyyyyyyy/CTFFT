function [ std_win, std_win_ft ] = make_stdwinfunc( flatwin_delta, flatwin_w, flatwin_eps, flatwin_eps_d, n, omega)
%UNTITLED2 この関数の概要をここに記述
%   詳細説明をここに記述
stdwin_delta = (flatwin_eps+flatwin_eps_d)*n/flatwin_delta;

std_win = zeros(n, 1);
bw = chebwin(flatwin_w,20*floor(log10(stdwin_delta)));
std_win(1:(flatwin_w+1)/2) = bw((flatwin_w+1)/2:end);
std_win(end:-1:end-(flatwin_w-1)/2+1) = bw((flatwin_w-1)/2:-1:1);

%for i = 1:n+1
%    std_win(i) = omega(-n/2*i, n+1)*std_win(i);
%end

%std_win(1:n+1) = omega(-n/2*(1:n+1), n+1)'.*std_win(1:n+1);
std_win_ft = fft(std_win);
std_win_ft = std_win_ft/std_win_ft(1);

std_win = std_win/std_win_ft(1);
end

