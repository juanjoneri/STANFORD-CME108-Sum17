%% Problem 3

% Part a

Int = [1, 0.5, 0.25, 0.125, 0.0625];
Err = [];
x = 0.5;
for i = 1:numel(Int)
    Err = [Err, abs(1/(1 + x^2) - del(x, Int(i)))];
end

loglog(Int, Err, '*')
title('Problem 3, part A')
figure

% Part b

Int = [1, 0.5, 0.25, 0.125, 0.0625];
Err = [];
x = 0.5;
for i = 1:numel(Int)
    exact = 1/(1 + x^2);
    numer = del(x, Int(i));
    Err = [Err, abs( (exact - numer) / exact )];
end

loglog(Int, Err, '*')
title('Problem 3, part B, A = 1')
figure

A = 100;
Int = E([1, 0.5, 0.25, 0.125, 0.0625], A);
Err = [];
x = E(0.5, A);
for i = 1:numel(Int)
    exact = 1/(1 + x^2);
    numer = del(x, Int(i));
    Err = [Err, abs( (exact - numer) / exact )];
end

loglog(Int, Err, '*')
title('Problem 3, part B, A = 100')

function [ y ] = del ( j, h )
    y = ( f(j-2*h) - 8*f(j-h) + 8*f(j+h) - f(j+2*h) ) / (12*h);
end

function [ y ] = E ( x, A )
    y = A*x;
end

function [ y ] = f ( x )
    y = atan(x);
end