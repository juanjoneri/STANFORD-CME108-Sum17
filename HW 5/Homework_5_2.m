%% Problem 2

X = linspace(0, 2);
plot(X, f(X))
title('Humps function')

xl = 1;
xr = 3;

[k, x, y] = bisect(xl, xr, 1e-8, @f);

fprintf('a)\nRoot found after %3i iterations at x = %f y = %2.9f \n',k, x, y)

options = optimset('tolX', 1.e-6);
[X_m,FVAL,EXITFLAG,OUTPUT] = fminsearch(@f, 0.5, options);
[X_j, k] = newtonMin(0.5, 1e-6, @fp, @fpp);

fprintf('\nb)\nMin found after %3i iterations at x = %f using fminsearch \n',OUTPUT.iterations, X_m)
fprintf('Min found after %3i iterations at x = %f using Newton \n',k, X_j)

fprintf('\n\nBoth algorithms converge to the same min of the function when\n')
fprintf('a tolerance of 10^(-6) is set, however Matlabs fminsearch takes more iterations\n')
fprintf('this is provably due to the fact that matlab does not have the extact values\n')
fprintf('for the first and second derivatives of the function f and thus needs to\n')
fprintf('compute them numerically')

function [x, k] = newtonMin (x0, tol, fp, fpp)
    k = 0;
    stop = 0;
    itr = 0;
    while ~stop
        x1 = x0 - fp(x0) / fpp(x0);

        if abs(x1 - x0) <= tol
            stop = 1;
            itr = k;
        end

        if k > 50
            fprintf(' Solution does not converge after %3i iterations \n',k)
            break
        end
        k = k+1;
        x0 = x1;
        x = x0;
    end
end

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

function [y] = fp (x)
    y = -(2.*(-0.9 + x))./(0.04 + (-0.9 + x).^2).^2 - (2.*(-0.3 + x))./(0.01 + (-0.3 + x).^2).^2;
end

function [y] = fpp (x)
    y = -2./(0.04 + (-0.9 + x).^2).^2 - 2./(0.01 + (-0.3 + x).^2).^2 + (8.*(-0.9 + x).^2)./(0.04 + (-0.9 + x).^2).^3 + (8*(-0.3 + x).^2)./(0.01 + (-0.3 + x).^2).^3;
end
