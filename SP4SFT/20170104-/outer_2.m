function [ s ] = outer_2( I, n, L  )
%outer_2 この関数の概要をここに記述
%   詳細説明をここに記述

s = zeros(n,1);

for j = 1:n
    for k = 1:L
        s(j) = s(j)+I(j,k);
    end
end

    


end

