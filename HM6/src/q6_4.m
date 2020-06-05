%report6 problem4

clc;clear;close all

X = [2 4 9 10 11 32];
Y1 = diff(X)
Y2 = diff(X, 2)

%use diff to approximate the derivatives of functions
h = 0.001;   %step size
X = 0:h:5;
Y = X .^ 3 + 2 * X .^ 2;
deriY_1 = diff(Y) / h;    % deriY_1 = 3x^2 + 2x
deriY_2 = diff(deriY_1) / h;  %deriY_2 = 6x + 2
plot(X(:,1:length(deriY_1)),deriY_1,'r', ...
    X,Y,'b', ...
    X(:,1:length(deriY_2)),deriY_2,'k');
axis([0, 5, 0, 100]);
legend({"Y' = 3x^2 + 2x", 'Y = x^3 + 2x^2', "Y''= 6x + 2"})

