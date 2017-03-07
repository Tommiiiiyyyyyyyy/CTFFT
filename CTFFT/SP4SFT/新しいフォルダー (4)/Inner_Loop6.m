function [ x_hat_il ] = Inner_Loop6( flatwin_ft, Z_I, I_HASH, I_OFFSET, TAU, omega, n, B, l, i )
%UNTITLED13 この関数の概要をここに記述
%   詳細説明をここに記述
HASH = mod(I_HASH(i,l), B);
HASH = HASH + (HASH == 0)*B;
x_hat_il = Z_I(HASH, l)*omega(TAU(l)*i,n)/flatwin_ft(n/(2*B) + 1 + I_OFFSET(i, l));
end

