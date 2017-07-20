syms('OK','A','B','N','H','XI0','XI1','XI2','NN','I','X','XI','s','x');

F = inline(cos(x),'x');

OK = 1;
res = ones(7,1);
for i=1:7

    A = 0;
    B = pi/2;

    N = 2^i;

    H = (B-A)/N;
    XI0 = F(A) + F(B);
    XI1 = 0;
    XI2 = 0;
    NN = N - 1;

    for I = 1:NN
        X = A + I * H;
        if rem(I,2) == 0  
            XI2 = XI2 + F(X);
        else
            XI1 = XI1 + F(X);      
        end
    end

    XI = (XI0 + 2.0 * XI2 + 4.0 * XI1) * H / 3.0;
    res(i) = XI;
    
end

format long
err = (res - 1);

rat = ones(6,1);

for i=1:6
    rat(i) = err(i) / err(i + 1);
end

rat
