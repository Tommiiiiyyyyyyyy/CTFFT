function [ z_hat ] = Inner_Loop3( y, flatwin_w, B )
%UNTITLED9 ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q
z = zeros(B, 1);
for k = 1:B
    for j = 0:floor(flatwin_w/B) - 1
        z(k) = z(k) + y(k+j*B);
    end
end
z_hat = fft(z);
end

