%% Problem 2

A = [ 2 -1  0  0 
     -1  2 -1  0
      0 -1  2 -1
      0  0 -1  2 ];
  
f = [
    1
    1
    1
    1
    ];


[L, U, P] = lu(A)

[a, b, c] = getVectors(A);

[b, f] = gaussEliminate ( a, b, c, f )

backSubstitute ( b, c, f )

% Retreive the vectors from the tridiagonal matrix
function [ a, b, c ] = getVectors (A)
    B = A; C = A;
    n = size(A, 1);
    
    A(1,:) = [];
    A(:,n) = [];
    
    C(:,1) = [];
    C(n,:) = [];

    a = [0, diag(A)']';
    b = diag(B);
    c = [diag(C)', 0]';
    
end

% Gauss tridiagonal elimination
function [ b, f ] = gaussEliminate ( a, b, c, f )
    n = size(b, 1);
    l = zeros(1, n);
    for j = 2:n
        l(j) = a(j)/b(j-1);
        b(j) = b(j)-l(j)*c(j-1);
        f(j) = f(j)-l(j)*f(j-1);
    end
end


% Back Substitution
function [ x ] = backSubstitute ( b, c, f )
    n = size(b, 1);
    x = zeros(1, n);
    x(n) = f(n)/b(n);
    for j=n-1:-1:1
        x(j) = (f(j)-c(j)*x(j+1))/b(j);
    end
end