function [ X_d ] = outer_5( I_d, x_Id )
%outer_5 ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q
for i = 1:numel(I_d)
    X_d(i) = mean(x_Id(i,:));
end

end

