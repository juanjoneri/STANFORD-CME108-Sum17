%% Problem 2


V = 1; D = 0.1;
x_0 = 0; x_L = 1;
y1_0 = 0; B = 0;
N = 1024;
h = (x_L-x_0)/N;
y2_guess = [0 .005];
tol = 0.00001;
fprintf('\n Iteration C(0) C''(1) \n')

for n = 1:15 % try 15 iterations
    
    if n <= 2
        y2_0(n) = y2_guess(n);
    end
    
    [x,y] = ode45(@(t,y) pollution(t,y,V,D),[x_0:h:x_L],[y1_0 y2_0(n)]);
    y2_L(n) = y(N+1,2);
    fprintf('%5.0f %16.6f %11.6f \n',n,y2_0(n),y2_L(n))
    
    if n > 1
        if abs(y2_L(n)-B) > tol
            y2_0(n+1) = y2_0(n-1)+(B-y2_L(n-1))*...
            (y2_0(n)-y2_0(n-1))/(y2_L(n)-y2_L(n-1));
        else
            break
        end
    end
end

plot(x,y(:,1),'r-')
xlabel('x')
ylabel('C(x)')
axis([0 1 -0.018 0.02])
title('Pollution Concentration')

function yprime = pollution(x,y,A1,A2)
    S = 0.1*exp(-100*(x-0.5)^2);
    yprime = [y(2); A1/A2*y(2)-S/A2];
end