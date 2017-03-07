function [ I_l ] = Inner_Loop5( I_hash, z_hat, dk, n, B )
%UNTITLED11 この関数の概要をここに記述
%   詳細説明をここに記述
I_l = zeros(n, 1);
abs_zft = abs(z_hat);
z_mag = sort(abs_zft,'descend');
Z = z_mag(1:dk);
Z_a = zeros(dk,1);

for k = 1:dk
    point = find(abs_zft == Z(k));
    Z_a(k) = point(1);
    abs_zft(Z_a(k)) = 0;
end

for k = 1:n
    HASH = mod(I_hash(k), B);
    HASH = HASH + (HASH == 0)*B;
    for j = 1:dk
        if HASH == Z_a(j)
            I_l(k) = 1;
            %abs_zft(HASH) = 0;
        end
    end
end
end

