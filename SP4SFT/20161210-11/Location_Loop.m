function [ I, I_l ] = Location_Loop( z_ft_abs, d, k, B, n )
%UNTITLED10 この関数の概要をここに記述
%   詳細説明をここに記述
    z_sort = sort(z_ft_abs,'descend');
    J = zeros(d*k,1);
    for i = 1:d*k
        j = 1;
        while z_ft_abs(j) < z_sort(i)
            j = j + 1;
        end
        J(i) = j;
        z_ft_abs(j) = 0;
    end
    n_hash = h(1:n);
    I = 0;
    for i = 1:d*k
        I = [I,find(n_hash == J(i))];
    end
    I_l = length(I);
    I = I(2:I_l);
end

