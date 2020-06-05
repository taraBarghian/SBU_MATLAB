clc;clear;close all


% calcute N(s) , H(s) 
N=[1 5 11 13]; 
D=[1 2 4]; 
%Derivative of the first order 
N1=polyder(N) 
[q,x] = polyder(N,D) 
%Derivative of the second order 
N2=polyder(N1)
%a=[1 4 11 14 18] 
%b=[1 4 12 16 16] 
[qq,xx] = polyder(q,x) 
%integrate 
Nint=polyint(N) 
Hint=polyint(deconv(N, D))