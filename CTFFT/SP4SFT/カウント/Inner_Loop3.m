function [ z_hat, COUNT_SFT ] = Inner_Loop3( y, flatwin_w, B, COUNT_SFT )
%UNTITLED9 この関数の概要をここに記述
%   詳細説明をここに記述
fB = floor(flatwin_w/B);
z = zeros(B, fB);
for k = 1:B
    z(k,:) = y(k + B*(0:fB-1));
    %for j = 0:floor(flatwin_w/B) - 1
     %   z(k) = z(k) + y(k+j*B);
    %end
end

z = sum(z,2);

z_hat = fft(z);
COUNT_SFT = COUNT_SFT + B*log2(B);
end

