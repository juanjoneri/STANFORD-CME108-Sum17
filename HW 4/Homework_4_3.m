%% Problem 3

syms x
digits(16)

X = linspace(0, 2);

for n = [2, 4, 8]

    figure
    plot(X,f(X,n))
    legend(strcat('(x-1)^', num2str(n)))

    [x, k] = Newton(@f, n, @fp, 1.1, 1.e-8);
    fprintf('Testing (x-1)^%i near 1.1 gives root at %f after %i iterations \n', n, x, k);

end

function [ y ] = f (x, n)
    y = (x-1).^n;
end

function [ y ] = fp (x, n)
    y = n*(x-1).^(n-1);
end

function [ x_zero, itr ] = Newton (f, n, fprime, x0, tol)

    x(1) = x0; % must supply initial guess
    y(1) = f(x(1), n);
    yprime(1) = fprime(x(1), n);
    k = 1;
    stop = 0;
    while ~stop
        x(k+1) = x(k)-y(k)/yprime(k);
        y(k+1) = f(x(k+1), n);
        if abs(x(k+1)-x(k)) <= tol
            itr = k+1; % total number of iterations
            x_zero = x(k+1); % zero of function
            stop = 1;
        end
        yprime(k+1) = fprime(x(k+1), n);
        k = k+1;
    end

end
