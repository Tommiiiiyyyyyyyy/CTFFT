function [ I_l ] = Inner_Loop5( I_hash, z_hat, dk, n, B )
%UNTITLED11 ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q
I_l = zeros(n, 1);
abs_zft = abs(z_hat);
z_mag = sort(abs_zft,'descend');
Z = z_mag(1:dk);
Z_a = find(abs_zft >= min(z_mag));


HASH = I_hash(1:n);
HASH = mod(HASH, B);
HASH = HASH + (HASH == 0)*B;
HASH = HASH';

check_HASH = repmat(HASH, 1, dk);
for i = 1:dk
    I_l = I_l + (check_HASH(:,i) == Z_a(i));
end
end

