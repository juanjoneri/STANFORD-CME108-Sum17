%% Problem 3
clear

l = -2.5;
step = 0.1; 
r =  2.5;

[Xs, Ys] = meshgrid(l:step:r,l:step:r);
Zs = bananaPlot(Xs, Ys);
contour(Xs, Ys, Zs)
hold on

% 2.1 Select an initial guess of position vector
X0 = [-1,2];

[X, k] = steepest(X0, @banana, @gradient, 1.e-6);
scatter3(X(:,1), X(:,2), banana(X))

function [X, k] = steepest (X0, f, grad, tol)
    
    stop = 0;
    k = 1;
    
    while ~stop
        % Store all intermediate steps for plt
        X(k, 1) = X0(1);
        X(k, 2) = X0(2);
        % 2.2 and evaluate the grad
        G0 = grad(X0);
        % 3 Use matlab to find the value of alpha that minimizes the new pair x, y
        A = fminbnd(@(a) f(X0 - a.*G0) , 0, 3);
        % 4 Calculate the new position
        X1 = X0 - A.*G0;
        % 5 Calculate the residual to stop when done
        if (norm(X1 - X0) < tol) || (k > 2000)
           stop = 1;
           X(k, 1) = X0(1);
           X(k, 2) = X0(2);
        end
        X0 = X1;
        k = k+1;
    end
end

function [z] = banana (X)
    x = X(:,1); y = X(:,2);
    z = 100 .* (y - x.^2).^2 + (1 - x).^2;
end

function [z] = bananaPlot (x, y)
    z = 100 .* (y - x.^2).^2 + (1 - x).^2;
end

% 1 Establish the analytical expression for the gradient
function [Z] = gradient (X)
    x = X(1); y = X(2);
    Z = [2*(200*x^3-200*x*y+x-1) 200*(y-x^2)];
end
