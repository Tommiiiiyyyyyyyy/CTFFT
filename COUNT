% 単純に行列の要素数から，要素に 0+i0,1+i0,-1+i0 があればその分を除外した数を出力する関数です．
% 配列として， 0+i0,1+i0,-1+i0 の要素数も一緒に出力できるようにしています．

function [count_A] = COUNT(A)
count_A = zeros(4,1);
count_A(1) = numel(A);
count_A(2) = numel(A(A==0));
count_A(1) = count_A(1) - count_A(2);
for j = 0:1
    count_A(j+3) = numel(A(A==exp(-1i*pi*j)));
    count_A(1) = count_A(1)-count_A(j+3);
end
end