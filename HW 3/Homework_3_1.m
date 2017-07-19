%% Problem 1

A = [ 2  5 -9  3
      5  6 -4  2
      3 -4  2  7
      11 7  4 -8 ];
 
b = [ 151
      103
       16
      -32 ];
   
LU = gaussEliminate(A)

lu(A)

% Gauss Elimination
function [ LU ] = gaussEliminate ( A )
    n = size(A, 1);
    L = eye(n);
    U = A;
    
    for k = 1:n-1 % elimination passes
        % make pos kk be largest from column k in lower diag
        [L, U] = maxPivot(L, U, k);
        
        for i = k+1:n % rows
            tmp = U(i,k)/U(k,k);
            for j=1:n
                U(i,j) = U(i,j)-tmp*U(k,j);
            end
            L(i,k) = tmp;
        end
    end
    LU = joinDiags(L, U);
end

function [ L, U ] = maxPivot ( L, U, k )
    n = size(U, 1);
    k_ = U(k,:);
    k__ = L(k,:);
    
    [M, I] = max(abs(U(k:n, k)));
    j = k + I - 1;
    j_ = U(j,:);
    j__ = L(j,:);
    
    
    U(k,:) = j_; L(k,:) = j__;
    U(j,:) = k_; L(j,:) = k__;
end

function [ O ] = joinDiags ( L, U )
    O = triu(U) + tril(L);
end

% Back Substitution
function [ x ] = BackSubstitute ( A, b )
    x = zeros(1, n);
    x(n) = b(n)/A(n,n);
    for i=n-1:-1:1
        x(i) = (b(n)-sum(A(i,i+1:n).*x(i+1:n)))/A(i,i);
    end
end
