function [ N, N_h, n, n_h, B, omega, shift, k, d, dk, flatwin_eps, flatwin_eps_d, flatwin_f, flatwin_delta, flatwin_w, I, L ] = define_param(  )
%SFT���s�����߂ɕK�v�Ȋe��p�����[�^��ݒ肷��֐��ł��D

N = 14;%����
N_h = N/2;

n = 2^N;%�v�Z����x�N�g���̒���
n_h = 2^N_h;



omega = @(x, y)exp(2i*pi*x/y);
shift = @(x, M) [zeros(x,M-x),eye(x);eye(M-x),zeros(M-x,x)];

k = 2^(N_h-1);

B = 2^(N_h+1);%�x�N�g���̕������C�d�v

c = 2;%delta�̗ݏ�萔
flatwin_eps = 1/B;
flatwin_eps_d = flatwin_eps/2;
flatwin_f = (flatwin_eps - flatwin_eps_d)/2;
flatwin_delta = n^(-c);
flatwin_c = 1;%���֐��̑�̕��̔��萔
flatwin_w = round(flatwin_c*B*log(n/flatwin_delta));%���֐��̑�̕�
flatwin_w = flatwin_w + (mod(flatwin_w, 2) == 0);%flatwin_w: must be  an odd number
I = @(x)(n/2+1+x);

d_c = 0.01;%d�̔��萔
d = round(d_c/flatwin_eps);
dk = d*k;

l = 3;%L�̔��萔�C�d�v
L = round(l*log(n));
end
