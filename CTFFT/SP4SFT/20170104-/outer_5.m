function [ X_d ] = outer_5( I_d, x_Id )
%outer_5 この関数の概要をここに記述
%   詳細説明をここに記述
for i = 1:numel(I_d)
    X_d(i) = mean(x_Id(i,:));
end

end

