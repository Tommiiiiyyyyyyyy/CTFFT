function [ hash, offset ] = define_hs_and_ofs( B, sigma, n )
%UNTITLED8 ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q
hash = @(i) round(sigma*i*B/n);
offset = @(i) sigma*i - hash(i)*n/B;
end

