function [ IF_M ] = IF_M( n, omega )
%F_M n+1 次元の偶関数の逆フーリエ変換を行う行列を生成します．
% n は必ず偶数，できれば2の階乗を指定してください．
IF_M = omega((-n/2:n/2)'*(-n/2:n/2) , n+1);
IF_M = IF_M/(n+1);
end