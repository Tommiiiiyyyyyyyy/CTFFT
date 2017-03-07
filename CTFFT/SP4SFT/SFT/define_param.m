function [ N, c, flatwin_c, d_c, l, k, B, prm_mat, filename_prm, R_S ] = define_param(  )

N = 16;%‹ô”

c = 1.5;

flatwin_c = 1.2;

d_c = 0.005;

l = 4;

k = 2^(N/2-2);
B = 2^(N/2+1);

rs = 1;%—”¶¬‚ÌƒV[ƒh

prm_mat = [ N, c, flatwin_c, d_c, l, k, B, rs ];

filename_prm = [num2str(N),num2str(c),num2str(flatwin_c),num2str(d_c),num2str(l),num2str(k),num2str(B),num2str(rs)];

rng(rs,'twister');

R_S = rng;
end
