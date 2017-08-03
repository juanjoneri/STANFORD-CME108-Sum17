%% Problem 3
clear

l = -4;
step = 0.5; 
r =  4;
lines = 20;

[Xs, Ys] = meshgrid(l:step:r,l:step:r);
Zs = bananaPlot(Xs, Ys);

% 2.1 Select an initial guess of position vector
X0 = [-1,2];

[X, k] = steepest(X0, @banana, @gradient, 1.e-6);
figure
mesh(Xs, Ys, Zs)
hold on
plot3(X(:,1), X(:,2), banana(X) + 0.5e3, 'Marker' , 'o');
view(-135, 60);
title('Steepest Descent')

last = size(X);
answer = X(last(1),:);
fprintf('a) Implement Steepest descent method.\nMin found after %3i iterations at x = %2.9f y = %2.9f \n',k, answer(1), answer(2))

[X, k] = conjugate(X0, @banana, @gradient, 1.e-6);
figure
mesh(Xs, Ys, Zs)
hold on
plot3(X(:,1), X(:,2), banana(X) + 0.5e3, 'Marker' , 'o')
view(-135, 60);
title('Conjugate Gradient')

last = size(X);
answer = X(last(1),:);
fprintf('\nb) Implement Conjugate gradient method.\nMin found after %3i iterations at x = %2.9f y = %2.9f \n',k, answer(1), answer(2))

answer = fminsearch(@banana, X0);
fprintf('\nc) Use Matlab build in fminsearch\nMatlab fminsearhc found a min at x = %2.9f y = %2.9f \n',answer(1), answer(2))

function [Xs, k] = conjugate (X0, f, grad, tol)
    
    X1 = X0;
    stop = 0;
    k = 1;
    
    Xs(k, 1) = X1(1);
    Xs(k, 2) = X1(2);
    G1 = grad(X1);
    R1 = -G1;
    P1 = R1;
    A1 = fminbnd(@(a) f(X1 + a.*P1) , 0, 3);
    X2 = X1 + A1.*P1;
    
    while ~stop
        % Store all intermediate steps for plt
        Xs(k, 1) = X2(1);
        Xs(k, 2) = X2(2);
        % 2.2 Calculate steepest direction
        G2 = grad(X2);
        R2 = -G2;
        % 3 Compute adjustment factor
        B2 = max( 0, dot( R2', (R2 - R1) ) / dot( R1', R1 ) );
        % 4 Update the search direction from steepest direction:
        P2 = R2 + B2.*P1;
        % 5 Perform line search:
        A2 = fminbnd(@(a) f(X2 + a.*P2), 0, 3);
        % 6 Calculate the new position
        X3 = X2 + A2.*P2;
        % 7 Calculate the residual to stop when done
        if (norm(X3 - X2) < tol) || (k > 2000)
           stop = 1;
           Xs(k, 1) = X3(1);
           Xs(k, 2) = X3(2);
        end
        X2 = X3;
        R1 = R2;
        P1 = P2;
        
        k = k+1;
    end
end

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
