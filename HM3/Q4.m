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
n=@(t) tan(t*(pi/4));
m=@(t) sin(t*(pi/2));
%---------------------------------
%part D
k=@(y) y.*exp(-y.*cos((8*pi).*y));


%-------------- subplot_1
subplot(2,2,1);
x = linspace(-3,5,100);
semilogy(x,f(x),'color',[.8, .5, 1])
xlabel('x');
ylabel('log(y)');
title('number 1');
text(2,50,'0.5e^{x^2-2x+2}'...
    ,'color','m','fontSize',12,'fontName','comicSans'); %set some attributes like color, font and ...

%-------------- subplot_2
subplot(2,2,2)
x = linspace(1,64,100);

plot(x,g(x),'-.b')
hold on
plot(x,z(x),'-.r')

xlabel('x');
ylabel('y');
title('number 2');
legend('g(x)=log2(x^3+1)','g(x)=log4(x^3+3)');

%-------------- subplot_3
subplot(2,2,3);
t=linspace(0,2,50);
yyaxis left
plot(t,m(t),'-.b');
hold on;
yyaxis right
plot(t,n(t),'-.m');

%-------------- subplot_4
subplot(2,2,4);
y=linspace(0,10,500);
semilogy(y,k(y),'color',[.2, .5, .5]);


