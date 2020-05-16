%Q4
clc;clear;close all

%define all functions :

% part A
f =@(x) 0.5*exp(x.^2 - 2.*x + 2);
%---------------------------------
% part B
g = @(x) log2(x.^3 + 1);
z = @(x) log(x.^3 + 3)/log(4); %logB(X) = logA(X) / logA(B)
%beacuse we dont have log4 in matlab
%---------------------------------
%part C
n=@(t) tan(t.*(pi/4));
m=@(t) sin(t.*(pi/2));
%---------------------------------
%part D
k=@(y) y.*exp(-y.*cos((8*pi).*y));


%-------------- subplot_1
subplot(2,2,1);
x = linspace(-3,5,100);
semilogy(x,f(x),'--pb','markerindices',1:3:length(x),'markeredgecolor','r')
xlabel('x', 'color',[0,.4,.2], 'fontsize',12);
ylabel('log(y)', 'color',[0,.4,.2], 'fontsize',12);
title('number 1');
text(1.5,100,'\it0.5e^{x^2-2x+2}'...
    ,'color','r','fontSize',10); %set some attributes like color, font and ...
axis tight
grid on

%-------------- subplot_2
subplot(2,2,2)
x = linspace(1,64,100);

plot(x,g(x),'-.b')
hold on
plot(x,z(x),'-.r')

xlabel('x', 'color',[0,.4,.2], 'fontsize',12);
ylabel('y', 'color',[0,.4,.2], 'fontsize',12);
title('number 2');
legend('g(x)=log2(x^3+1)','g(x)=log4(x^3+3)');
axis tight
grid on

%-------------- subplot_3
subplot(2,2,3);
t=linspace(0,2,50);
yyaxis left
plot(t,m(t),'-*b');

xlabel('x', 'color',[0,.4,.2], 'fontsize',12);
ylabel('y', 'color',[0,.4,.2], 'fontsize',12);
title('number 3');

hold on;
yyaxis right
plot(t,n(t),'-or');

%or we can handle it shorter :
%plotyy(t,n(t),t,m(t));
legend('\it m(t)=sin((\pi/2)t)','\it n(t)=tan((\pi/4)t)');
axis tight
grid on

%-------------- subplot_4
subplot(2,2,4);
y=linspace(0,10,500);
semilogy(y,k(y),'b');
text(1.5,10000,'\it k(y)=y.e^{-y}.cos(8\piy)'...
    ,'color','r','fontSize',11);

xlabel('log(x)', 'color',[0,.4,.2], 'fontsize',12);
ylabel('log(y)', 'color',[0,.4,.2], 'fontsize',12);
title('number 4');

axis fill
grid on

