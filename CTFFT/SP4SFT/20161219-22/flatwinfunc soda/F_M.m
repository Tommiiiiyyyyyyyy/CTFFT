function [ F_M ] = F_M( n, w )
%F_M n+1 次元の偶関数のフーリエ変換を行う行列を生成します．
% n は必ず偶数，できれば2の階乗を指定してください．
F_M = zeros(n+1);
for i = 1:n+1
    for j = 1:n+1
        F_M(i,j) = w((i-(n/2+1))*(j-(n/2+1)) ,n+1);
    end
end
end

