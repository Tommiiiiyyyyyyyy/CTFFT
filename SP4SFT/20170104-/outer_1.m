function [ I,z, z_ft, HASH, OFFSET] = outer_1( n, L, x, G, B, W, d, k )
%outer_1 この関数の概要をここに記述
%   詳細説明をここに記述


I = zeors(n, L);


for i = 1:L
    [ z, z_ft, I_r, hash, offset ] = Inner_Loop(n, x, G, B, W, d, k);
    for j = 1:numel(I_r)
        I(I_r(j),i) = 1;
    end
    HASH(i) = hash;
    OFFSET(i) = offset
end
end

