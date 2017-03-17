function [ N_h, n, n_h, B, omega, k, d, dk, flatwin_eps, flatwin_eps_d, flatwin_f, flatwin_delta, flatwin_w, I, L ] = make_other_prm( N, c, flatwin_c, d_c, l, k, B)
%UNTITLED ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q
omega = @(x, y)exp(2i*pi*x/y);%p.3 2 Notation �Œ�`���ꂽ�� 

N_h = N/2;

n = 2^N;% �x�N�g���̑傫��
n_h = 2^N_h;



flatwin_eps = 1/B;% p.4 flat window function �̊e�p�����[�^�D
flatwin_eps_d = flatwin_eps/2;
flatwin_f = (flatwin_eps - flatwin_eps_d)/2;
flatwin_delta = n^(-c);

flatwin_w = round(flatwin_c*B*log(n/flatwin_delta));
flatwin_w = flatwin_w + (mod(flatwin_w, 2) == 0);%flatwin_w: must be  an odd number
I = @(x)(n/2+1+x);

d = round(d_c/flatwin_eps);% p.8 4.2 LEMMA 4.3.
dk = d*k;% �I�������f�[�^�̓��C��ʉ��Ԗڂ܂ł�I�����邩�Dd,k �̑I�ѕ��ɂ���Ă�B�𒴂��邱�Ƃ�����̂Œ���

L = round(l*log(n));% ���[�v��
end

