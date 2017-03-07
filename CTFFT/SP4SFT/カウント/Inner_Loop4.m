function [I_hash, I_offset, COUNT_SFT ] = Inner_Loop4( sigma, n, B, COUNT_SFT )
%UNTITLED10 この関数の概要をここに記述
%   詳細説明をここに記述
hash_func = @(x)(round(x*sigma*B/n));
offset_func = @(x)(sigma*x - round(sigma*x*B/n)*n/B);
I_hash = hash_func(1:n);
%COUNT_SFT = COUNT_SFT + n;
I_offset = offset_func(1:n);
%COUNT_SFT = COUNT_SFT + n;
end

