G = zeros(256,31);


for i = 1:31
    G(i:132+i,i) = chebwin(133,10^10);
end

W = zeros(256,1);
O = ones(31,1);

%for i = 1:256
%    for j = 1:31
%        W(i) = W(i)+G(i,j);
%    end
%end

W = G*O;

wvtool(W)