%% Problem 4

syms x
digits(16)

X = linspace(3, 4);

figure
plot(X,f(X))
legend('f')

[x, k] = Secant(@f, 3.1, 3.5, 1.e-8);
fprintf('Testing f gives root at %f after %i iterations \n', x, k);

function [ y ] = f (x)
    y = cos(x.^2).*(x-1).^3;
end


function [ x_zero, itr ] = Secant (f, x0, x1, tol)

    x(1) = x0; % must supply initial guesses
    x(2) = x1;
    
    y(1) = f(x(1));
    y(2) = f(x(2));
    
    k = 2;
    stop = 0;
    while ~stop
        x(k+1) = x(k)-y(k)*(x(k)-x(k-1))/(y(k)-y(k-1));
        y(k+1) = f(x(k+1));
        if abs(x(k+1)-x(k)) <= tol
            itr = k+1; % total number of iterations
            x_zero = x(k+1); % zero of function
            stop = 1;
        end
        k = k+1;
    end

end
