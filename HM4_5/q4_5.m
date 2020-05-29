clc;clear;close all
% calcute N(s) , H(s)
N=[1 5 11 13];
D=[1 2 4];
%Derivative of the first order
N1=polyder(N);
[q,x] = polyder(N,D);
%Derivative of the second order
N2=polyder(polyder(N));
%a=[1 4 11 14 18]
%b=[1 4 12 16 16]
[qq,xx] = polyder(q,x);
%integrate
Nint=int(N);
Hint=int(deconv(N, D));

% input :coefficients
%**Examples**%
%x^3+2x^2-4x+3
p = [1 2 -4 3];
%output:coefficients after Differentiation
%3,4,-4
polyder(p);
% calcutes the total polynomial then Differentiation
%3x^2+6x2+9
p1 = [3 6 9];
%x^2+2x
p2 = [1 2 0];
%(p1.p2)'
polyder(p1,p2);
%also can use 'conv' and have the same answer
q = conv(p1,p2);
polyder(q);%same answer as above
%Quotient 
q1 = [3 6 9];
q2 = [1 2 0];
[q,d] = polyder(q1,q2);



