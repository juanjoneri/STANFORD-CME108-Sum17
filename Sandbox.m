A = magic(4)
maxPivot ( A, 3 )

%[M, I] = max(A(2:4,1))

function [ A ] = swapCol ( A, i, j )
    k = A(i,:);
    k_lg = A(j,:);
    A(i,:) = k_lg;
    A(j,:) = k;
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