clear

N = zeros(250,1);

a = chebwin(100,100);

b = chebwin(50,500);

Na = N;
Na(1:100) = a;

Nb = N;

for j = 1:30
    Nb(1+5*(j-1):50+5*(j-1)) = Nb(1+5*(j-1):50+5*(j-1)) + b*10^(-(j-1)/3);
end
%Nb(1:50) = b;
%Nb(51:100) = b;
Nb(1:100) = Nb(1:100) + a;

wvtool(Na)
wvtool(Nb)