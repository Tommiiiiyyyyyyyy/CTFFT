function [ I_d ] = Outer_Loop2_3( I, L, n )
%UNTITLED14 この関数の概要をここに記述
%   詳細説明をここに記述
S = sum(I,2);
I_d = (S > max(S)/3);
end

