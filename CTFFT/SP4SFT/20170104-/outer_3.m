function [ I_d ] = outer_3( s, n, L )
%outer_3 ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q

I_d = zeros(n, 1);
for i = 1:n
    I_d(i) = (s(i) >= L/2);
end

end

