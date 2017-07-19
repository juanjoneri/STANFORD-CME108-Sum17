A = magic(4)
B = ones(4)

joinDiags(A, B)

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