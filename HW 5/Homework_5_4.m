%% Problem 4

e = 0:0.05:1;
T = time(e, [0, 1], [1,-1]);
plot(e, T);
xlabel('position of e');
ylabel('time to travel');
title('sketch');

newtonMin(0.5, 1e-6, @timep, @timepp)

function [x, k] = newtonMin (x0, tol, fp, fpp)
    k = 0;
    stop = 0;
    while ~stop
        x1 = x0 - fp(x0) / fpp(x0);

        if abs(x1 - x0) <= tol
            stop = 1;
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

function [t] = time (e, A, B)
    % Using natural units here 
    t = 2/3 .* sqrt((e - A(1)).^2 + A(2).^2) + sqrt((e - B(1)).^2 + B(2).^2);
end

function [t] = timep (e)
    A = [0, 1];
    B = [1,-1];
    % Using natural units here 
    t = (2 .*(-A(1) + e))./(3.* sqrt(A(2).^2 + (A(1) - e).^2)) + (-B(1) + e)./sqrt(B(2).^2 + (B(1) - e).^2);
end

function [t] = timepp (e)
    A = [0, 1];
    B = [1,-1];
    % Using natural units here
    t = (2* A(2).^2)./(3.* (A(1).^2 + A(2).^2 - 2 .* A(1).* e + e.^2).^(3/2)) + B(2).^2./(B(1).^2 + B(2).^2 - 2 .* B(1) .* e + e.^2).^(3/2);
end