function [ x_hat ] = Outer_Loop4(  flatwin_ft, L,Z_I, I_HASH, I_OFFSET, TAU, omega, n, B )
%UNTITLED15 ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q
x_hat = zeros(n, L);
for l = 1:L
    for i = 1:n
        [ x_hat_il ] = Inner_Loop6(  flatwin_ft, Z_I, I_HASH, I_OFFSET, TAU, omega, n, B, l, i );
        x_hat(i, l) = x_hat_il;
    end
end
end

