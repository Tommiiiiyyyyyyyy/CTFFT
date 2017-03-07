function [ x_d ] = inner_6( I, z_ft, G_ft, w, hash, sigma, offset, tau )
%inner_6 Estimation loop
%   Ú×à–¾‚ğ‚±‚±‚É‹Lq
x_d = zeros(numel(I),1);

for i = 1:numel(I)
    x_d(i) = z_ft(hash(I(i)))*w(tau*I(i))/G_ft(offset(I(i)));
end

end

