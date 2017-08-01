% given an initial guess for the solution x, solve a 2x2
% nonlinear system using a Newton-Raphson method.
clear
x = [0;1]; % Initial guess
residual = 1;
k = 0;
fprintf(' k x y abs(f)\n')
fprintf(' %2i %10.6f %10.6f %10.6f\n',k,x,residual)
while residual > 1e-5
f = [x(1)*x(1)+3*cos(x(2))-1; % compute the f system
x(2)+2*sin(x(1))-2];
J = [ 2*x(1) -3*sin(x(2)); % compute the Jacobian
2*cos(x(1)) 1 ];
xtemp = x;
x = x-(J\f); % solve system and update
residual = norm(xtemp-x); % compute the residual
k = k+1;
fprintf(' %2i %10.6f %10.6f %10.6f\n',k,x,residual)
end
