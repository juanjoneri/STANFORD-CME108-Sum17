%% Problem 1

% given an initial guess for the solution x, solve a 2x2
% nonlinear system using a Newton-Raphson method.
clear
x = [0;1]; % Initial guess
residual = 1;
k = 0;
fprintf(' k x y abs(f)\n')
fprintf(' %2i %10.6f %10.6f %10.6f\n',k,x,residual)

while residual > 1e-2
    f = [cos(2*x(1))-cos(2*x(2))-0.4;
         2*(x(2)-x(1))+sin(2*x(2))-sin(2*x(1))-1.2];

    J = [-2*sin(x(1)) 2*sin(2*x(2));    % compute the Jacobian
        -2-2*cos(2*x(1)) 2+2*cos(2*x(2))];

    xtemp = x;
    
    x = x-(J\f);
    
    residual = norm(xtemp-x);
    k = k+1;
    fprintf(' %2i %10.6f %10.6f %10.6f\n',k,x,residual)
end
