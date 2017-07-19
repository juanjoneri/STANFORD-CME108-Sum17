A = [
     5 0 0
     1 2 0
    -1 3 2
    ]

A_ = [
      4  2 1
      0 10 1
      0  0 7
      ]

b = [
    15
    7
    5
    ]

b_ = [
      11
      23
      21
      ]

forwardSubstitute(A, b)
backSubstitute(A_, b_)

%[M, I] = max(A(2:4,1))

function [ A ] = swapCol ( A, i, j )
    k = A(i,:);
    k_lg = A(j,:);
    A(i,:) = k_lg;
    A(j,:) = k;
end

function [ O ] = joinDiags ( U, L )
    O = triu(U) + tril(L);
end

function [ A ] = maxPivot ( A, k )
    n = size(A, 1);
    k_ = A(k,:);
    
    [M, I] = max(A(k:n, k));
    j = k + I - 1;
    j_ = A(j,:);
    
    
    A(k,:) = j_;
    A(j,:) = k_;
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