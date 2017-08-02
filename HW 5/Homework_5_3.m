%% Problem 3

[X,Y] = meshgrid(-2:0.1:2,-2:0.1:2);
Z = banana(X, Y);
surf(X,Y,Z)

function [z] = banana (x, y)
    z = 100 .* (y - x.^2).^2 + (1 - x).^2;
end
