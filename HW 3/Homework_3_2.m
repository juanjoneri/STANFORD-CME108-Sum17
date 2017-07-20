%% Problem 2

A = [ 2 -1  0  0 
     -2  2 -1  0
      0 -1  2 -2
      0  0 -1  2 ];
  
b = [
    1
    1
    1
    1
    ]

[a, b, c] = getVectors(A)

function [ a, b, c ] = getVectors (A)
    B = A; C = A;
    n = size(A, 1);
    
    A(1,:) = [];
    A(:,n) = [];
    
    C(:,1) = [];
    C(n,:) = [];

    a = diag(A);
    b = diag(B);
    c = diag(C);
    
end

% Gauss tridiagonal elimination
function [ A ] = gaussEliminate ( A )
    for j = 2:n % loop through n-1 elimination passes
        l(j) = a(j)/b(j-1);
        b(j) = b(j)-l(j)*c(j-1);
        f(j) = f(j)-l(j)*f(j-1);
    end
end


% Back Substitution
function [ A ] = backSubstitute ( A )
x(n) = f(n)/b(n);
for j=n-1:-1:1
    x(j) = (f(j)-c(j)*x(j+1))/b(j);
end
end