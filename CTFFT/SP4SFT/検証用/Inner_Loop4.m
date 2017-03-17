function [I_hash, I_offset ] = Inner_Loop4( sigma, n, B )
%UNTITLED10 この関数の概要をここに記述
%  hash関数とoffset関数の定義．
hash_func = @(x)(round(x*sigma*B/n));
offset_func = @(x)(sigma*x - round(sigma*x*B/n)*n/B);
I_hash = hash_func(1:n);
I_offset = offset_func(1:n);
end

