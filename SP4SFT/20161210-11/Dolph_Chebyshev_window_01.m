function [D_C_W] = Dolph_Chebyshev_window_01(W, alp)
beta = cosh(acosh(10^alp)/W);

b_cos = @(k) beta*cos(pi*k/W);

D_C_W = zeros(1, W);

D_C_W = (cos(W*acos(b_cos(1:W))))/(cosh(W*acosh(beta)));

D_C_W = D_C_W';
end