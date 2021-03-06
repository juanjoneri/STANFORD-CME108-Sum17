%% Problem 2

syms t

% Part a

X = -5:5;
Y = runge(X);

A = [];
for i = 1:11
    A = [A ; row(X(i), 10)];
end

x = A\Y';
T = row (t, 10);
P = T * x;

X = linspace(-5, 5);
y1 = vpa (subs( P, t, X));
y2 = runge(X);

figure
plot(X,y1,'b--',X,y2,'r')
legend('Lagrange Polynomial','Runges function')
title('Part a')

% Part b

X = myCos(10);
Y = runge(X);

A = [];
for i = 1:11
    A = [A ; row(X(i), 10)];
end

x = A\Y';
T = row (t, 10);
P = T * x;

X = linspace(-5, 5);
y1 = vpa (subs( P, t, X));
y2 = runge(X);

figure
plot(X,y1,'b--',X,y2,'r')
legend('Lagrange Polynomial','Runges function')
title('Part b')

% Part c

x = -5:5;  y = runge(x);
xx = linspace(-5, 5);
yy = spline(x,y,xx);
figure
plot(x,y,'o',xx,yy)
legend('Runges function','Cubic Spline')
title('Part c')

function [ y ] = runge ( x )
    y = 1 ./ (1 + x.^2);
end

function [ C ] = myCos ( n )
    J = 0:n;
    C = 5 .* cos(J .* pi ./ n);
end

function [ A ] = row ( x, order )
    A = [];
    for i = 0:order
        A = [A, x^i];
    end
end