%% Problem 7
clear

N=11;
M=11;
dx=2/(N-1);
dy=1/(M-1);
x = 0:dx:2;
y = 0:dy:1;

tol = 1e-5;

p = zeros(M,N);
res = zeros(M,N);


p(:,1)=0;                       % Left side at 0
p(:,N)=y;                       % Right side at y
p(1,:)=p(2,:);                  % Derivative at upper boundary is 0
p(M,:)=p(M-1,:);                % Derivative at lower boundary is 0

j=2:N-1;
i=2:M-1;

error = 10;
iter_count = 0;
sor = 1.75;

while error > tol
    error = 0;
    
    for j = 2:N-1
        for i = 2:M-1
            res(i,j) = (p(i-1,j)+p(i+1,j)+p(i,j+1)+p(i,j-1))/4-p(i,j);
            p(i,j) = p(i,j) + sor*res(i,j);
            error = max(error, abs(res(i,j)));
        end
    end
       
    % Reinforce the boundary contitions
    p(:,1)=0;
    p(:,N)=y;
    p(1,:)=p(2,:);
    p(M,:)=p(M-1,:);
    
    iter_count = iter_count+1;
    ek(iter_count) = abs((0.25-p(6,6))/0.25);
end

fprintf('SOR = %1.2f gives %i iterations\n',sor,iter_count);
plot(ek)
title('Relative error at center')
ylabel('e(k)')
xlabel('k')
figure

surf(x,y,p,'EdgeColor','none');       
shading interp
title('2-D Laplace''s equation')
xlabel('x')
ylabel('y')
zlabel('T(x, y)')