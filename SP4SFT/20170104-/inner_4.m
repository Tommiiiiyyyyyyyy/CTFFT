function [ hash, offset ] = inner_4(sigma, n, B )
%inner_4 ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q
hash = @(i)(round(sigma*i*B/n));
offset = @(i)(sigma*i - hash(i)*n/B);
end

