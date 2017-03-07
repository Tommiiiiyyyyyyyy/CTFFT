function [ I, AI, x_hat ] = I_loop( n, W, w, G, B, d, k )
[sigma, tau, sigma_tau] = make_rand_s_t(x, W);

y = G(1:W)*sigma_tau(1:W);

W_p_B = floor(W/B);

Z = zeros(W, W_p_B);
for i = 1:W
    Z(i, 1:W_p_B) = y(i+(0:W_p_B-1));
end
z = Z*ones(W,1);

z_ft = fft(z);
z_ft_abs = abs(z_ft);

[ hash, offset ] = define_hs_and_ofs( B, sigma, n );

[ I, I_l ] = Location_Loop( z_ft_abs, d, k, B, n );
AI = zeros(n,1);

for i = 1:I_l
    AI(I(i)) = 1;
end

[ x_hat ] = Estimation_Loop( w, G, z_ft, hash, offset, tau, I_l );



end

