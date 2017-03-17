function [ I, I_HASH, I_OFFSET, TAU, SIGMA, Z_I ] = Outer_Loop1( L, n, flatwin, x, flatwin_w, B, dk, TAU, SIGMA )
%UNTITLED12 この関数の概要をここに記述
%   Outer Loop 1
%   Inner Loop を 1~5 まで，L回繰り返します．
I = zeros(n, L);%L回分の投票用の箱
Z_I = zeros(B, L);%L回分の z の DFT の結果を保存しておく箱
I_HASH = zeros(n, L);%
I_OFFSET = zeros(n, L);
for i = 1:L
    [ sigma, tau ] = Inner_Loop1( n );
    TAU(i) = tau;
    SIGMA(i) = sigma;
    [ y] = Inner_Loop2( sigma, tau, flatwin, x, n);
    [ z_hat ] = Inner_Loop3( y, flatwin_w, B );
    Z_I(:,i) = z_hat;
    [ I_hash, I_offset ] = Inner_Loop4( sigma, n, B );
    I_HASH(:,i) = I_hash';
    I_OFFSET(:,i) = I_offset';
    [ I_l ] = Inner_Loop5( I_hash, z_hat, dk, n, B );
    I(:,i) = I_l;
end

end

