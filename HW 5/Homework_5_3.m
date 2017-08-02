%% Problem 3
clear

l = -2;
step = 0.1; 
r =  2;

[x, y] = meshgrid(l:step:r,l:step:r);
s = size(x);
A = reshape([x; y],s(1)*s(2),2);
% A(:,1) al x's | A(:,2) al y's
% A(1,:) first pair (x, y)

%Z = banana(x, y);
%surf(x, y, Z)

% 2.1 Select an initial guess of position vector
X0 = [-1,2];
% 2.2 and evaluate the grad
G0 = gradient(X0);

A = fminbnd(@(a) banana(X0 - a.*G0) , 0, 2);

function [z] = banana (X)
    x = X(1); y = X(2);
    z = 100 .* (y - x.^2).^2 + (1 - x.^2);
end

% 1 Establish the analytical expression for the gradient
function [Z] = gradient (X)
    x = X(1); y = X(2);
    Z = [2*(200*x^3-200*x*y+x-1) 200*(y-x^2)];
end
