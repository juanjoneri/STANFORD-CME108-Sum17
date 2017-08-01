
X = linspace(0, 2);
plot(X, f(X))

function [y] = f (x)
    y = 1./((x-0.3).^2 + 0.01) + 1./((x-0.9).^2 + 0.04) - 6;
end
