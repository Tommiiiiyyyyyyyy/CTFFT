function [ z_hat ] = Inner_Loop3( y, flatwin_w, B )
%UNTITLED9 この関数の概要をここに記述
%   詳細説明をここに記述
z = zeros(B, 1);
for k = 1:B
    for j = 0:floor(flatwin_w/B) - 1
        z(k) = z(k) + y(k+j*B);
    end
end
z_hat = fft(z);
end

