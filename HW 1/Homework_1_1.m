%% Problem 1

Taylor_Table = [
    1, 1, 1, 1
    0 h 2*h 3*h
    0 1/2*h^2 2*h^2 9/2*h^2
    0 1/6*h^3 4/3*h^3 9/2*h^3
    ];

Sol = [0, -1, 0, 0];

linsolve(Taylor_Table, Sol')