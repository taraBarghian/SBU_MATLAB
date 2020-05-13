%Q5
clc;clear;close all

figure(1);

[x,y]=meshgrid(-2.5:.1:2.5 , -6:.2:6);
Z=y.^2.*exp(-x.^2 + y.^2);

subplot(2,2,1);
plot3(x,y,Z);
grid on
xlabel('x','color','b');
ylabel('y','color','b');
zlabel('Z=f(x,y)','color','b');
title('plot3','color','r','fontSize',12);

subplot(2,2,2);
mesh(x,y,Z);
xlabel('x','color','b');
ylabel('y','color','b');
zlabel('Z=f(x,y)','color','b');
title('mesh','color','r','fontSize',12);


subplot(2,2,3);
surf(x,y,Z);
xlabel('x','color','b');
ylabel('y','color','b');
zlabel('Z=f(x,y)','color','b');
title('surf','color','r','fontSize',12);


subplot(2,2,4);
contour(x,y,Z);
xlabel('x','color','b');
ylabel('y','color','b');
title('contour','color','r','fontSize',12);

%------------------------------
figure(2)

[m,n]=meshgrid(-7:.2:7 , -5:.1:5);
W=cos(x).*cos(y);

subplot(2,2,1);
plot3(x,y,W);
grid on
xlabel('x','color','b');
ylabel('y','color','b');
zlabel('W=f(x,y)','color','b');
title('plot3','color','r','fontSize',12);

subplot(2,2,2);
mesh(x,y,W);
xlabel('x','color','b');
ylabel('y','color','b');
zlabel('W=f(x,y)','color','b');
title('mesh','color','r','fontSize',12);

subplot(2,2,3);
surf(x,y,W);
xlabel('x','color','b');
ylabel('y','color','b');
zlabel('W=f(x,y)','color','b');
title('surf','color','r','fontSize',12);

subplot(2,2,4);
contour(x,y,W);
xlabel('x','color','b');
ylabel('y','color','b');
title('contour','color','r','fontSize',12);
