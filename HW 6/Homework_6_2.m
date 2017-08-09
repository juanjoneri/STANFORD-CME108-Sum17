%% Problem 2
clear
bet = 0.3;

x_0 = 0; x_L = 10;
N = 500;
h = (x_L-x_0)/N;

y1_0 = 0; 
y2_0 = 0;
y3_guess = [0 1];
B = 1;

tol = 1e-8;

fprintf('\nIteration    C''''(0)        C''(10) \n')

for n = 1:15

    if n <= 2
        y3_0(n) = y3_guess(n);
    end

    [x,y] = ode45(@(t,y) flow(t, y, bet), 0:0.01:10, [y1_0 y2_0 y3_0(n)]);
    y2_L(n) = y(end, 2);
    fprintf('%5.0f %16.6f %11.6f \n', n, y3_0(n), y2_L(n))

    if n > 1
        if abs(y2_L(n)-B) > tol
            y3_0(n+1) = y3_0(n-1)+(B-y2_L(n-1))*(y3_0(n)-y3_0(n-1))/(y2_L(n)-y2_L(n-1));
        else
            break
        end
    end
end

plot(x, y(:,1))
hold on
plot(x, y(:,2))

xlabel('Scaled distance normal to the wall (\eta)')
legend('f(\eta)','f''(\eta)')
title('Flow of the fluid, boundary layer profile')

function yp = flow(x, y, bet)
    yp(1) = y(2);
    yp(2) = y(3);
    yp(3) = - y(1).*y(3) - bet.*(1 - y(2).^2);
    yp = yp';
end