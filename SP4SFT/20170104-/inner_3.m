function [z, z_ft] = inner_3(y, B, W)
%inner_3 ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q
z = zeros(B,1);
z_ft = zeros(B,1);
for i = 1:B
    for j = 0:(W/B)-1
        z(i) = z(i) + y(i + j*B);
    end
end
z_ft = fft(z);
end

