function [ hash, offset ] = inner_4(n, B )
%inner_4 ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q
hash = @(i, sigma)(round(sigma*i*B/n));
offset = @(i, sigma, hash)(sigma*i - hash(i)*n/B);
end
