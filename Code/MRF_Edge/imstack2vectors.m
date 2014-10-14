function [X, R] = imstack2vectors(S, MASK)
[M, N, n] = size(S);
if nargin == 1 %http://www.mathworks.in/help/techdoc/ref/nargin.html  Number of function input arguments
   MASK = true(M, N);%true(m, n) or true([m, n]) is an m-by-n matrix of logical ones.
else
   MASK = MASK ~= 0;
end

[P, Q] = find(MASK); %http://www.mathworks.in/help/techdoc/ref/find.html 
%ind = find(X) locates all nonzero elements of array X, and returns the linear indices of those elements in vector ind.
%for linear indices refer http://www.mathworks.in/help/techdoc/math/f1-85462.html#f1-85511 

R = [P, Q];

Q = M*N;
X = reshape(S, Q, n); %B = reshape(A,m,n) returns the m-by-n matrix B whose elements are taken column-wise from A. An error results if A does not have m*n elements.
%http://www.mathworks.in/help/techdoc/ref/reshape.html
%[M, N, n] = size(X)
MASK = reshape(MASK, Q, 1);
%[M, N, n] = size(MASK)
X = X(MASK, :);
end