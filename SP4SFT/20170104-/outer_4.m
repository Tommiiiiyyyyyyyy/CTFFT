function [ x_Id ] = outer_4( I_d, z_ft, G_ft, w, hash, sigma, offset, tau )
%outer_4 この関数の概要をここに記述
%   詳細説明をここに記述

for i = 1:L
    [ x_d ] = inner_6( I_d, z_ft, G_ft, w, hash, sigma, offset, tau );
    x_Id(:,i) = x_d;
end
end

