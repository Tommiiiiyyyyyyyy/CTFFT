function [ z_hat ] = Inner_Loop3( y, flatwin_w, B )
%UNTITLED9 ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q
fB = floor(flatwin_w/B);
z = zeros(B, fB);
for k = 1:B
    z(k,:) = y(k + B*(0:fB-1));
    %for j = 0:floor(flatwin_w/B) - 1
     %   z(k) = z(k) + y(k+j*B);
    %end
end

z = sum(z,2);

z_hat = fft(z);
end
