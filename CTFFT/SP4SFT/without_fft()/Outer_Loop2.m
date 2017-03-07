function [ I_d ] = Outer_Loop2( I, L )
%UNTITLED14 この関数の概要をここに記述
%   詳細説明をここに記述
S = zeros(n,1);
S = I*ones(L, 1);
I_d = (S > L/3);
end

