function [ I ] = outer_1( L,d, k, hash, z_ft )
%outer_1 この関数の概要をここに記述
%   詳細説明をここに記述


I = zeors(n, L);


for i = 1:L
    [ I_r ] = inner_5( d, k, hash, z_ft );
    for j = 1:numel(I_r)
        I(I_r(j),i) = 1;
end
end

