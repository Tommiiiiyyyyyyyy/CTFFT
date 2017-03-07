function [ output_args ] = inner_6( I, z_ft, G_ft, w, hash, sigma, offset, tau )
%inner_6 ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q
x = zeros(numel(I),2);

for i = 1:numel(I)
    x(1,i) = I(i);
    x(2,i) = z_ft(hash(I(i)))*w(tau*I(i))/G_ft(offset(I(i)));
end

end
