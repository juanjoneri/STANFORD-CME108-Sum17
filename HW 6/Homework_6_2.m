%% Problem 2

bet = 0.3;

x_0 = 0; x_L = 10;
N = 500;
h = (x_L-x_0)/N;

y1_0 = 0; 
y2_0 = 0;
y3_guess = [10 20];
B = 1;

tol = 0.0001;

fprintf('\nIteration    C(0)        C''(10) \n')

for n = 1:50

    if n <= 2
        y3_0(n) = y3_guess(n);
    end

    [x,y] = ode45(@(t,y) flow(t, y, bet), x_0:h:x_L, [y1_0 y2_0 y3_0(n)]);
    y3_L(n) = y(N+1,3);
    fprintf('%5.0f %16.6f %11.6f \n', n, y3_0(n), y3_L(n))

    if n > 1
        if abs(y3_L(n)-B) > tol
            y3_0(n+1) = y3_0(n-1)+(B-y3_L(n-1))*(y3_0(n)-y3_0(n-1))/(y3_L(n)-y3_L(n-1));
        else
            break
        end
    end
end

plot(x, y(:,1))
xlabel('nu')
ylabel('f(nu)')
axis([0 10 0 300])
title('Flow of the fluid')

function yp = flow(x, y, bet)
    yp(1) = y(2);
    yp(2) = y(3);
    yp(3) = - y(1).*y(3) - bet.*(1 - y(2).^2);
    yp = yp';
end