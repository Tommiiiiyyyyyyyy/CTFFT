function [ sigma, tau ] = Inner_Loop1( n )
%UNTITLED7 この関数の概要をここに記述
%   詳細説明をここに記述
tau = randi(n);
sigma = 2*randi(n/2) - 1;
end

