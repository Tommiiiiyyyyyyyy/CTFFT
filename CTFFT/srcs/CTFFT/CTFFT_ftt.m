% Main function of CTFFT.

function [x_ft] = CTFFT_ftt(N, n, x_std, w)
	x = bitrevorder(x_std); %Bit reversal [a_0,a_1,...,a_N-1]->[a_0,a_N/2,a_1,a_N/2+1,...,a_N/2-1,a_N-1]
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
	x_ft = x;
end