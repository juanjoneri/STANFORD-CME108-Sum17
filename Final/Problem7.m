%% Problem 7

clear

%%
%Specifying parameters
nx=11;                           %Number of steps in space(x)
ny=11;                           %Number of steps in space(y)       
tol=1e-5;                         %Tolerance
dx=2/(nx-1);                     %Width of space step(x)
dy=1/(ny-1);                     %Width of space step(y)
del = dx;
x=0:dx:2;                        %Range of x(0,2) and specifying the grid points
y=0:dy:1;                        %Range of y(0,2) and specifying the grid points

%%
%Initial Conditions
p=zeros(ny,nx);                  %Preallocating p
pn=zeros(ny,nx);                 %Preallocating pn
res = zeros(ny,nx);

%%
%Boundary conditions
p(:,1)=0;                        %left side at 0
p(:,nx)=y;                       %Right side at y
p(1,:)=p(2,:);                   %Derivative at upper boundary is 0
p(ny,:)=p(ny-1,:);               %Derivative at lower boundary is 0

%%
%Explicit iterative scheme with C.D in space (5-point difference)
j=2:nx-1;
i=2:ny-1;
error = 10;
while error>tol
    error = 0;
    pn=p;
    
    for j = 2:nx-1
        for i = 2:ny-1
            res(i,j) = (p(i-1,j)+p(i+1,j)+p(i,j+1)+p(i,j-1))/4-p(i,j);
        end
    end
   
    p = p+res;
    error = max(error,norm(res));
    p(:,1)=0;
    p(:,nx)=y;
    p(1,:)=p(2,:);
    p(ny,:)=p(ny-1,:);   
end

%%
%Plotting the solution
surf(x,y,pn,'EdgeColor','none');       
shading interp
title('2-D Laplace''s equation')
xlabel('Spatial co-ordinate (x) \rightarrow')
ylabel('{\leftarrow} Spatial co-ordinate (y)')
zlabel('Solution profile (P) \rightarrow')