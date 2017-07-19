%% Problem 1

A = [ 2  5 -9  3
      5  6 -4  2
      3 -4  2  7
      11 7  4 -8 ];
 
b = [ 151
      103
       16
      -32 ];
   
gaussEliminate(A)

lu(A)

% Gauss Elimination
function [ A ] = gaussEliminate ( A )
    n = size(A, 1);
    for k = 1:n-1 % elimination passes
        % make pos kk be largest from column k in lower diag
        A = maxPivot(A, k)
        
        for i = k+1:n % rows
            tmp = A(i,k)/A(k,k);
            for j=1:n
                A(i,j) = A(i,j)-tmp*A(k,j);
            end
        end
    end
end

function [ A ] = maxPivot ( A, k )
    n = size(A, 1);
    k_ = A(k,:);
    
    [M, I] = max(abs(A(k:n, k)));
    j = k + I - 1;
    j_ = A(j,:);
    
    
    A(k,:) = j_;
    A(j,:) = k_;
end

% Back Substitution
function [ x ] = BackSubstitute ( A, b )
    x = zeros(1, n);
    x(n) = b(n)/A(n,n);
    for i=n-1:-1:1
        x(i) = (b(n)-sum(A(i,i+1:n).*x(i+1:n)))/A(i,i);
    end
end
