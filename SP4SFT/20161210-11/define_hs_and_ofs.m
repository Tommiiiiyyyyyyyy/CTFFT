function [ hash, offset ] = define_hs_and_ofs( B, sigma, n )
%UNTITLED8 この関数の概要をここに記述
%   詳細説明をここに記述
hash = @(i) round(sigma*i*B/n);
offset = @(i) sigma*i - hash(i)*n/B;
end

