function [ I_d ] = outer_3( s, n, L )
%outer_3 この関数の概要をここに記述
%   詳細説明をここに記述

I_d = zeros(n, 1);
for i = 1:n
    I_d(i) = (s(i) >= L/2);
end

end

