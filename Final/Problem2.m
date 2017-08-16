%% Problem 4

clear
x = [1;1;1]; % Initial guess
residual = 1;
k = 0;
fprintf('  0   x          y          z          abs(f) \n')
fprintf(' %2i %10.6f %10.6f %10.6f %10.6f \n',k,x,residual);
while residual > 1e-6
f = [8*x(1)*x(1)+x(2)*x(2)-x(3)+1; % compute the f system
    2*x(1)+3*x(2)*x(2)+x(3)-1;
    4*x(1)*x(1)+9*x(2)*x(2)+x(3)*x(3)-4*x(1)-1];


residual = norm(f); % compute the residual
J = [16*x(1) 2*x(2) -1; % compute the Jacobian
    2 6*x(2) 1;
    8*x(1) 18*x(2) 2*x(3)];
x = x-(J\f); % solve system and update
k = k+1;
fprintf(' %2i %10.6f %10.6f %10.6f %10.6f\n',k,x,residual)
end
