%% Problem 1

syms h

Taylor_Table = [
    1 1 1 1 1
    -2*h -h 0 h 2*h
    2*h^2 h^2/2 0 h^2/2 2*h^2
    -4/3*h^3 -h^3/6 0 h^3/6 4/3*h^3
    2*h^4/3 h^4/24 0 h^4/24 2*h^4/3
    ];

Sol = [0, 0, 1, 0, 0];

Alph = linsolve(Taylor_Table, Sol')