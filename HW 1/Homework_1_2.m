%% Problem 2

X = [];
Y = [];
for j = 0.0:0.1:4.0
    % Fill in with descrete values    
    X = [X, j];
    Y = [Y, foo(j)];
end

Yp = [fow_diff(X, 1)];
for j = 2:numel(X)
    Yp = [Yp, back_diff(X, j)];
end

plot(X, Yp)
title('Problem 2, part A')
figure
plot(diff(Y))
title('Problem 2, part B')

function [ y ] = back_diff ( X, j )
    y = ( foo(X(j)) - foo(X(j-1)) ) / 0.1;
end

function [ y ] = fow_diff ( X, j )
    y = ( foo(X(j+1)) - foo(X(j)) ) / 0.1;
end

function [ y ] = foo ( x )
    y = 5*cos(10*x) + x^3 - 2*x^2 - 6*x + 10;
end