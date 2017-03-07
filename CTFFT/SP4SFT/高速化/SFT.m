function [ X_hat_d, I_d ] = SFT(  L, n, flatwin, x, flatwin_w, B, dk, flatwin_ft, omega )
%UNTITLED この関数の概要をここに記述
%   詳細説明をここに記述
    TAU = zeros(L, 1);
    SIGMA = zeros(L, 1);
    
    [ I, I_HASH, I_OFFSET, TAU, SIGMA, Z_I ] = Outer_Loop1( L, n, flatwin, x, flatwin_w, B, dk, TAU, SIGMA );
    
    [ I_d ] = Outer_Loop2_3( I, L, n );
    
    [ x_hat ] = Outer_Loop4( flatwin_ft, L,Z_I, I_HASH, I_OFFSET, TAU, omega, n, B, I_d );
    
    [ X_hat_d ] = Outer_Loop5( n, I_d, x_hat );


end

