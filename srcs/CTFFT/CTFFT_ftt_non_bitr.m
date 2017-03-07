% Main function of CTFFT.
% Version with no bit inversion.

function [x_ft] = CTFFT_ftt_non_bitr(N, n, x_std, w)
	B_0 = zeros(N);
    I_0 = eye(N/4);
    W_20 = w(0)*eye(N/4);
    W_21 = w(2^(n-1))*eye(N/4);
    
    B_0(1:2:N/2-1,1:2:N/2-1) = I_0;
    B_0(2:2:N/2,1:2:N/2-1) = I_0;
    B_0(N/2+1:2:N-1,2:2:N/2) = I_0;
    B_0(N/2+2:2:N,2:2:N/2) = I_0;
    
    B_0(1:2:N/2-1,N/2+1:2:N-1) = W_20;
    B_0(2:2:N/2,N/2+1:2:N-1) = W_21;
    B_0(N/2+1:2:N-1,N/2+2:2:N) = W_20;
    B_0(N/2+2:2:N,N/2+2:2:N) = W_21;
    
    x = B_0*x_std;

	for k=2:n
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