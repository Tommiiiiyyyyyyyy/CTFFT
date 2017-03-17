function [ I_d ] = Outer_Loop2_3( I, L, n )
%UNTITLED14 この関数の概要をここに記述
%   Outer Loop 2 と 3．
S = sum(I,2);
I_d = (S > max(S)/3);%投票．論文では，L/2 となっていますが，それだとLが大きくなるとほとんど引っかからなくなります．
end

