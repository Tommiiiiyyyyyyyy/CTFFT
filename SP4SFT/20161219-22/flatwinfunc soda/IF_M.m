function [ IF_M ] = IF_M( n, w )
%F_M n+1 次元の偶関数の逆フーリエ変換を行う行列を生成します．
% n は必ず偶数，できれば2の階乗を指定してください．
IF_M = zeros(n+1);
for i = 1:n+1
    for j = 1:n+1
        IF_M(i,j) = w((i-(n/2+1))*(j-(n/2+1)) ,n+1);
    end
end
IF_M = IF_M/(n+1);
end