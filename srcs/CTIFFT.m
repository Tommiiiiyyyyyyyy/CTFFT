% 逆フーリエ変換です．
function [x_std] = CTFFT_iftt(N, n, x_ft, w)
x_ft_c = conj(x_ft);
x = bitrevorder(x_ft_c);
for k=1:n
	x_new = zeros(N,1);
    	B = zeros(2^k);
    
   	wv = w(2^(n-k)*(0:2^(k-1)-1));
    
   	B = [eye(2^(k-1)) diag(wv); eye(2^(k-1)) -diag(wv)];

	for l = 0:2^(n-k)-1
		x_new(l*2^k+1:(l+1)*2^k) = B*x(l*2^k+1:(l+1)*2^k);
    	end
    	x = x_new;
end
x_std = conj(x)/N;
end