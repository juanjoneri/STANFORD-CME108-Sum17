%% Problem 5

syms x

fprintf('a) \n\n')

ans = Dn (@f, 1, 1, 4, 4);

fprintf('\nb)\n\n %f percent error in final answer \n', percentErr(1, ans));


function [ err ] = percentErr (act, com)
    err = 100 * abs(com - act) / act;
end

function [ y ] = f (x)
    y = log(x^2 + 1);
end

function [ d ] = D ( f, x0, h )

    d = ( f(x0) - f(x0 - h) ) / h;

end

function [ d ] = Dn ( f, x0, h, k, m )
    if m == 1
        d = D(f, x0, h/(2^(k-1)));
    else
        d = ( 2^(m-1) * Dn(f, x0, h, k, m-1) - Dn(f, x0, h, k-1, m-1) ) / (2^(m-1) - 1);
    end
    
    fprintf('D_%i,%i = %f \n', k, m, d );
end