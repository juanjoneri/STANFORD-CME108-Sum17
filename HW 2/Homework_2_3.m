%% Problem 3

syms t;

% Part a

% We are changing the range to have smaller values to avoid large operations like 2000^7
X = [1978:2:1992] - 1976;
Y = [12, 12.7, 13, 15.2, 18.2, 19.8, 24.1, 28.1];

P = Lagrange(X, Y)

XX = linspace(2, 16);
y1 = vpa (subs( P, t, XX));

figure
plot(XX,y1,'b--',X,Y,'o')
xticklabels(1978:2:1992)
legend('Lagrange Polynomial','Data Point')
title('Part a')

fprintf('Estimate for 1994 using Lagrange: %f \n', vpa (subs( P, t, 18)));

% Part b

x = [1978:2:1992];  y = [12, 12.7, 13, 15.2, 18.2, 19.8, 24.1, 28.1];
xx = linspace(1978, 1992);
yy = spline(x,y,xx);
figure
plot(x,y,'o',xx,yy)
xticklabels(1978:2:1992)
legend('Data Point','Cubic Spline')
title('Part b')

fprintf('Estimate for 1994 using Cubic Spline: %f \n', spline(x,y,1994));

% Function Definitions

function [ LP ] = Lagrange ( X, Y )
    t = sym('t');
    order = length(X);
    A = [];
    for i = 1:order
        A = [A ; row(X(i), order - 1)];
    end
    
    x = A\Y';
    T = row (t, order - 1);
    LP = T * x;
    
    function [ A ] = row ( x, order )
        A = [];
        for j = 0:order
            A = [A, x^j];
        end
    end
end

function [ A ] = row ( x, order )
    A = [];
    for i = 0:order
        A = [A, x^i];
    end
end