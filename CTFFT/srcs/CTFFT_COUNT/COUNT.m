% Returns the number of 0, + - 1+i0 elements of matrix A and the number of other elements.
% count_A(1) = the number of other elements of A.
% count_A(2) = the number of -1+i0 of A.
% count_A(3) = the number of 0+i0 of A.
% count_A(4) = the number of 1+i0 of A.

function [count_A] = COUNT(A)
count_A = zeros(4,1);
count_A(1) = numel(A);
for j = -1:1
    count_A(j+3) = numel(A(A==abs(j)*exp(-1i*pi*j)));
    count_A(1) = count_A(1)-count_A(j+3);
end
end