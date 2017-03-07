function [ I_d ] = Outer_Loop2_3( I, L, n )
%UNTITLED14 この関数の概要をここに記述
%   詳細説明をここに記述
S = zeros(n,1);
S = I*ones(L, 1);
I_d = (S > max(S)/3);%最も多く選ばれた座標の投票数の1/3を閾値にしました．
end

