%% Problem 5

% Part a

syms x x0 x1 x2

x0 = -1;
x1 = 1;
x2 = 2;

L = [
    (x - x1)*(x - x2) / ( (x0 - x1)*(x0 - x2) )
    (x - x0)*(x - x2) / ( (x1 - x0)*(x1 - x2) )
    (x - x0)*(x - x1) / ( (x2 - x0)*(x2 - x1) )
    ];

disp(L)

% Part b

x0 = 1;
x1 = 2;
x2 = 3;

L = [
    (x - x1)*(x - x2) / ( (x0 - x1)*(x0 - x2) )
    (x - x0)*(x - x2) / ( (x1 - x0)*(x1 - x2) )
    (x - x0)*(x - x1) / ( (x2 - x0)*(x2 - x1) )
    ];

X = [x0 x1 x2];
Y = log(X);
LagPol = Y*L;

disp( LagPol )

Test = [1.5 2.4];
for i = 1:numel(Test)
    fprintf('Testing %f \n', Test(i));
    fprintf('Estimate: %f Real: %f \n', vpa (subs( LagPol, x, Test(i))), log( Test(i)));
end

X = linspace(1/2, 7/2);
y1 = vpa (subs( LagPol, x, X));
y2 = log(X);

figure
plot(X,y1,'b--',X,y2,'r')
legend('Lagrange Polynomial','ln(x)')