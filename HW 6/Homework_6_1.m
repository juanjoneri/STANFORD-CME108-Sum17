%% Problem 6

tspan = [0 50];
y0 = 0.5;
h = 0.05;
[t1,y_RK4] = RK4(@f,tspan,y0,h);
plot(t1,y_RK4,'r-')
xlabel('t')
ylabel('y(t)')
legend('RK4')
axis([0.0 50 0.0 0.5])


function yprime = f(t,y)
    y = max(y, 0);
    r0 = 0.03;
    R = 0.5;
    g = 9.81;
    yprime = - r0^2 * (2*g*y)^(1/2) / (2*y*R - y^2);
end

function [t,y] = RK4(f,tspan,y0,h)
    t(1) = tspan(1);
    y(1) = y0;
    n = 1;
    while t(n) < tspan(2)
        t(n+1) = t(n)+h;
        k1 = f(t(n),y(n));
        k2 = f(t(n)+0.5*h,y(n)+0.5*h*k1);
        k3 = f(t(n)+0.5*h,y(n)+0.5*h*k2);
        k4 = f(t(n+1),y(n)+h*k3);
        y(n+1) = y(n)+1/6*h*(k1+2*k2+2*k3+k4);
        n = n+1;
    end
end