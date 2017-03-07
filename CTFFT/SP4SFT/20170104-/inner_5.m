function [ I ] = inner_5( d, k, hash, z_ft )
%inner_5 Location_LOOP
%   Ú×à–¾‚ğ‚±‚±‚É‹Lq
h_I = hash(1:n);

dk = d*k;
abs_z = abs(z_ft);
mag_z = sort(abs_z,'descend');

max_z = mag_z(1:dk);

k = 1;
for i = 1:dk
    for j = 1:n
        if abs_z(h_I(j)) == max_z(i)
            I(k) = j;
            k = k + 1;
        end
    end
end
end

