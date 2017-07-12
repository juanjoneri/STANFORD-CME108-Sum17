%% Problem 1

syms t

A = [];

for i = 1:4
    A = [A ; row(i, 3)];
end

b = [11, 29, 65, 125]'

x = A\b
T = row (t, 3)

P = T * x

vpa (subs( P, t, 3.3))

function [ A ] = row ( x, order )
    A = [];
    for i = 0:order
        A = [A, x^i];
    end
end
