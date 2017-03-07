function [ I_l ] = Inner_Loop5( I_hash, z_hat, dk, n, B )
%UNTITLED11 この関数の概要をここに記述
%   詳細説明をここに記述
I_l = zeros(n, 1);
abs_zft = abs(z_hat);
z_mag = sort(abs_zft,'descend');
Z = z_mag(1:dk);
Z_a = find(abs_zft >= min(z_mag));


HASH = I_hash(1:n);
HASH = mod(HASH, B);
HASH = HASH + (HASH == 0)*B;
HASH = HASH';


for i = 1:dk
    I_l = I_l + (HASH == Z_a(i));
end
end

