function [ x_hat ] = Outer_Loop4(  flatwin_ft, L,Z_I, I_HASH, I_OFFSET, TAU, omega, n, B, I_d )
%UNTITLED15 この関数の概要をここに記述
%   詳細説明をここに記述
x_hat = zeros(n, L);
HASH = mod(I_HASH, B);
HASH = HASH + (HASH == 0)*B;
point = find(I_d ~= 0);
%for i = 1:numel(point)
    for l = 1:L
    x_hat(point, l) = Z_I(HASH(point, l), l).*omega(TAU(l)*point, n)./flatwin_ft(I_OFFSET(point, l)+n/2);%inner_loop6; estimation loop
%    end
end

end

