function [  ] = O_loop( L, n, W, G, B, w )
for i = 1:L
    [ I, AI, x_hat ] = I_loop( n, W, w, G, B, d, k );
    I_L(i) = AI;
    X_hat(i) = x_hat;
end





end

