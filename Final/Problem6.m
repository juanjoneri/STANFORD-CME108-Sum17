%% Problem 6

% using finite difference with central difference in both
%
close all
%
N = 41; % number of discrete points
% Calculate vector x for plotting
%
xL = 0; % left boundary
xR = 2; % right boundary
h = (xR-xL)/(N-1); % grid spacing
x = linspace(xL,xR,N); % x(j) for plots
%
% Calculate tridiag matrix elements for interior points j=2,3,...,N?1
%
c(1:N-2) = x(2:N-1) - 1 - 1/2.*x(2:N-1).*h;
c(1) = 0 %not used
c(N-1) = 80*h-2;
b(1:N-1) = - 2*x(2:N) + 2 + h^2;
b(N-1) = -4*h*(40*h-1-20*h^2)+(-80*h+2+h^2);
a(1:N-2) = x(2:N-1) - 1 + 1/2.*x(2:N-1).*h;
a(N-1) = 0; %not used

% Calculate right hand side vector (source terms)
%
f(1) = -h^2*(1-h)^2;
f(2:N-2) = -h^2*(1-x(3:N-1)).^2;
f(N-1) = -h^2*(1-40*h)^2 + h*(40*h-1-20*h^2);

% Call 'tridiag' to solve for y
y = tridiag(N-1,a,b,c,f);
% y vector has N2 interior points, add yL and yR.
y = [yL y yR];


%
% calculate exact solution for comparison
x1 = linspace(xL,xR,1025);
yexact = 1-exp(x1)-29*x1./10 + 3.*exp(2)*x1./5 + x1.^2;
plot(x(1:N),y(1:N),'or',x1,yexact,'k','linewidth',1.15)
ylim([-0.2 1.6])
h_leg = legend(['N = ',num2str(N)],'Exact','Location','NorthWest');
set(h_leg,'fontsize',13)
xlabel('x','fontsize',15)
ylabel('y(x)','fontsize',15)
title('Solution of (x-1)y'''' - xy'' + (1-x^2) = 0','fontsize',15)
text(0.35,3.75,'Dirichlet BC, y N = 1.43','fontsize',13)
%print(figure(1),'?dpdf','finite diff example dirichlet.pdf')

%
function x = tridiag(n,a,b,c,f)
    for j = 2:n
        b(j) = b(j)-a(j)/b(j-1)*c(j-1);
        f(j) = f(j)-a(j)/b(j-1)*f(j-1);
    end
    
    x(n) = f(n)/b(n);
    
    for j=n-1:-1:1
        x(j) = (f(j)-c(j)*x(j+1))/b(j);
    end
end