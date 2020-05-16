clc;clear;close all

[X,Y]=meshgrid(-10:0.1:10);

Z=sin(X.^2 + Y.^2)./sqrt(X.^2 + Y.^2);

subplot(3,2,1);
plot3(X,Y,Z);
grid on
xlabel('x');
ylabel('y');
title("plot3 z");

subplot(3,2,2);
mesh(X,Y,Z);
xlabel('x');
ylabel('y');
title("mesh z");

subplot(3,2,3);
meshc(X,Y,Z);
xlabel('x');
ylabel('y');
title("mesh-contour z");

subplot(3,2,4);
surf(X,Y,Z);
xlabel('x');
ylabel('y');
title("surf z");

subplot(3,2,5);
contour(X,Y,Z);
xlabel('x');
ylabel('y');
title("contour z");