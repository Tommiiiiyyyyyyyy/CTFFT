function [ I_l ] = Inner_Loop5( I_hash, z_hat, dk, n, B )
%UNTITLED11 ���̊֐��̊T�v�������ɋL�q
%  Inner Loop 5
I_l = zeros(n, 1);
abs_zft = abs(z_hat);
z_mag = sort(abs_zft,'descend');%z �̃t�[���G�ϊ����������ʂ̐�Βl���~���ɕ��ёւ�
Z = z_mag(1:dk);%�~���ɕ��ёւ�������dk�i�傫���l����j���o���D
Z_a = find(abs_zft >= min(z_mag));%Z �Ɋ܂܂��l�̍��W��������D


HASH = I_hash(1:n);% 1~N �܂ł� hash�֐��̒l�D
HASH = mod(HASH, B);
HASH = HASH + (HASH == 0)*B;
HASH = HASH';% �s�Ɨ�̓���ւ�


for i = 1:dk
    I_l = I_l + (HASH == Z_a(i));%hash�֐����g���CB>>n��
end
end

