function [ N, c, flatwin_c, d_c, l, k, B ] = define_param(  )

N = 18;%‹ô”

c = 1.5;

flatwin_c = 1;

d_c = 0.001;

l = 4;

k = 2^(N/2-2);
B = 2^(N/2);
end
