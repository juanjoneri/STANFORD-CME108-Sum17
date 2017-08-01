%% Problem 2

X = linspace(0, 2);
plot(X, f(X))
title('Humps function')

xl = 1;
xr = 3;

[k, x, y] = bisect(xl, xr, 1e-6, @f)

fprintf(' Solution converged after %3i iterations at x = %f y = %2.8f \n',k, x, y)


function [k, xm, ym] = bisect (xl, xr, tol, f)
yl = f(xl);
yr = f(xr);

k = 0;
stop = 0;
itr = 0;
while ~stop
    xm = (xl+xr)/2;
    ym = f(xm);
    if abs(f(xm)) <= tol
        stop = 1;
        itr = k;
    else
        if ym*yl < 0
            xr = xm;
            yr = ym;
        else
            xl = xm;
            yl = ym;
        end
    end
    
    if k > 50
        fprintf(' Solution does not converge after %3i iterations \n',k)
        break
    end
    k = k+1;
end
end

function [y] = f (x)
    y = 1./((x-0.3).^2 + 0.01) + 1./((x-0.9).^2 + 0.04) - 6;
end
