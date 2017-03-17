function [ I_l ] = Inner_Loop5( I_hash, z_hat, dk, n, B )
%UNTITLED11 この関数の概要をここに記述
%  Inner Loop 5
I_l = zeros(n, 1);
abs_zft = abs(z_hat);
z_mag = sort(abs_zft,'descend');%z のフーリエ変換をした結果の絶対値を降順に並び替え
Z = z_mag(1:dk);%降順に並び替えた内のdk個（大きい値から）取り出す．
Z_a = find(abs_zft >= min(z_mag));%Z に含まれる値の座標を見つける．


HASH = I_hash(1:n);% 1~N までの hash関数の値．
HASH = mod(HASH, B);
HASH = HASH + (HASH == 0)*B;
HASH = HASH';% 行と列の入れ替え


for i = 1:dk
    I_l = I_l + (HASH == Z_a(i));%hash関数を使い，B>>nに
end
end

