function [I_hash, I_offset ] = Inner_Loop4( sigma, n, B )
%UNTITLED10 ���̊֐��̊T�v�������ɋL�q
%  hash�֐���offset�֐��̒�`�D
hash_func = @(x)(round(x*sigma*B/n));
offset_func = @(x)(sigma*x - round(sigma*x*B/n)*n/B);
I_hash = hash_func(1:n);
I_offset = offset_func(1:n);
end

