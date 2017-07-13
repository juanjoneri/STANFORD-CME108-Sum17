%% Problem 5

A = [
    2 -3 3
    3 3 9
    3 3 5
    ];

U = [
    2 -3 3
    0 7.5 4.5
    0 0 -4
    ];

L = [
    1 0 0
    1.5 1 0
    1.5 1 1
    ];

% Checking my answers
L * U

[LM UM PM] = lu(A)