function [ s ] = outer_2( I, n, L  )
%outer_2 ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q

s = zeros(n,1);

for j = 1:n
    for k = 1:L
        s(j) = s(j)+I(j,k);
    end
end

    


end

