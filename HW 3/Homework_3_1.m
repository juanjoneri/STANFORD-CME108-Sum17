%% Problem 1

A = [ 2  5 -9  3
      5  6 -4  2
      3 -4  2  7
      11 7  4 -8 ];
 
b = [ 151
      103
       16
      -32 ];

% Apply LU decomposition to A to obtain the L, U, and P,
[L, U, P] = gaussEliminate(A)

% For any right hand side b, calculate Pb (column vector),
b_ = P * b

% Use forward substitution to solve for y in equation Ly = Pb,
y = forwardSubstitute(L, b_)

% Use back substitution to solve for the unknowns x in equation Ux = y.
x = backSubstitute(U, y)

% Compare to actual solution
A\b

% Gauss Elimination
function [ L, U, P ] = gaussEliminate ( A )
    n = size(A, 1);
    L = eye(n); U = A; P = eye(n);
    
    for k = 1:n-1 % elimination passes
        % make pos kk be largest from column k in lower diag
        [L, U, P] = maxPivot(L, U, P, k);
        
        for i = k+1:n % rows
            tmp = U(i,k)/U(k,k);
            for j=1:n
                U(i,j) = U(i,j)-tmp*U(k,j);
            end
            L(i,k) = tmp;
        end
    end
    L = myTril(L);
end

function [ L, U, P ] = maxPivot ( L, U, P, k )
    n = size(U, 1);
    k_ = U(k,:);
    k__ = L(k,:);
    k___ = P(k,:);
    
    [M, I] = max(abs(U(k:n, k)));
    j = k + I - 1;
    j_ = U(j,:);
    j__ = L(j,:);
    j___ = P(j,:);
    
    
    U(k,:) = j_; L(k,:) = j__; P(k,:) = j___;
    U(j,:) = k_; L(j,:) = k__; P(j,:) = k___;
end

function [ O ] = joinDiags ( L, U )
    O = triu(U) + tril(L);
end

% Back Substitution
function [ x ] = backSubstitute ( A, b )
    n = size(A, 1);
    x = zeros(1, n);
    x(n) = b(n)/A(n,n);
    for i = n-1:-1:1
        x(i) = (b(i)-sum(A(i,i+1:n).*x(i+1:n)))/A(i,i);
    end
end

% Forward Substitution
function [ x ] = forwardSubstitute ( A, b )
    n = size(A, 1);
    x = zeros(1, n);
    x(1) = b(1)/A(1,1);
    for i = 2:n
        x(i) = (b(i)-sum(A(i,1:i-1).*x(1:i-1)))/A(i,i);
    end
end

function [ A ] = myTril ( A )
    % Restore the ones in the diagonal of the L matrix
    A = tril(A);
    A(eye(size(A))~=0) = 1;
end
