%% Problem 5

repes = 12;

log = zeros(repes, 1);
for i = 1:repes
    log(i) = simpson (@cos, pi/(2*2^i), 0, pi/2);
end

err = ones(repes, 1) - log;

rat = zeros(repes-1, 1);
for i = 1:repes-1
    rat(i) = err(i+1)/err(i);
end

rat

function [ I ] = simpson (f, h, l, r)

    v = l:h:r;
    N = size(v,2);
    
    I = f(v(1)) + f(v(N));
    I = I + 4*sum(f(v(3:2:N-1)));
    I = I + 2*sum(f(v(2:2:N-2)));
    
    I = h/3 * I;
end


