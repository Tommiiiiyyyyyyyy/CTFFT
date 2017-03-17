function [ z_hat ] = Inner_Loop3( y, flatwin_w, B )
%UNTITLED9 この関数の概要をここに記述
%   Inner Loop 3
fB = floor(flatwin_w/B);
z = zeros(B, fB);
for k = 1:B
    z(k,:) = y(k + B*(0:fB-1));% forall i in B に対し，y(i+j*B)(j=0,..,[w/B]-1)をもとめる．
    %for j = 0:floor(flatwin_w/B) - 1
     %   z(k) = z(k) + y(k+j*B);
    %end
end

z = sum(z,2);% sum(y(i+j*B)) forall i in B

z_hat = fft(z);%DFT of z
end

