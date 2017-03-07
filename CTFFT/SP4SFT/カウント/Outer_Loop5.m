function [ X_hat_d ] = Outer_Loop5( n, I_d, x_hat )
%UNTITLED18 この関数の概要をここに記述
%   詳細説明をここに記述
rm_x_hat = median(real(x_hat),2);
im_x_hat = median(imag(x_hat),2);

X_hat_d = complex(rm_x_hat, im_x_hat);

X_hat_d = I_d.*X_hat_d;
end

