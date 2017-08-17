%% Problem 5

clear

x(1) = 1; %This could be anything as shown above
x(2) = -2;

tol = 1.e-6;
dim = length(x);
[f,df,ddf] = func(x); % calculate f,gradien(f),hessian(f)
iter = 0;

fprintf(' iter   x         y          f        \n')
format = '%5i %10.6f %10.6f %10.6f\n';

fprintf(format,iter,x,f);

while norm(df) > tol && iter <= 5000
    x
    df
    ddf
    eye(2)/ddf
    x = x-df/ddf;
    [f,df,ddf] = func(x);
    iter = iter+1;
    fprintf(format,iter,x,f);
end


function [phi,dphi,hphi] = func(x)
phi = 2*x(1)^2-2*x(1)+4*x(2)^2-6*x(2)+2*x(1)*x(2);
% gradient
dphi(1) = 4*x(1)+2*x(2)-2;
dphi(2) = 8*x(2)+2*x(1)-6;
% Hessian
hphi(1,1) = 4;
hphi(1,2) = 2;
hphi(2,1) = 2;
hphi(2,2) = 8;
end
