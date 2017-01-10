function [ hash, offset ] = inner_4(n, B )
%inner_4 この関数の概要をここに記述
%   詳細説明をここに記述
hash = @(i, sigma)(round(sigma*i*B/n));
offset = @(i, sigma, hash)(sigma*i - hash(i)*n/B);
end
