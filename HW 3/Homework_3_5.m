%% Problem 5

simpson (@cos, pi/32, 0, pi/2)

function [ I ] = simpson (f, h, l, r)

    v = l:h:r
    N = size(v,2)
    
    I = f(v(1)) + f(v(N));
    I = I + 4*sum(f(v(3:2:N-1)));
    I = I + 2*sum(f(v(2:2:N-2)));
    
    I = h/3 * I;
end


