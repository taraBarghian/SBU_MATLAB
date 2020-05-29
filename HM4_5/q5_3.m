%report5 problem3

clc;clear;close all

A=@(x) sin(2*x).*cos(2*x);
B=@(x) sin(3*x).*sin(2*x);
C=@(x) (sin(3*x)).^2;
D=@(x) sin(3*x).*cos(2*x);
E=@(x) cos(3*x).*cos(2*x);
F=@(x) (cos(2*x)).^2;

Ia=integral(A,-2*pi,2*pi)
Ib=integral(B,-2*pi,2*pi)
Ic=integral(C,-2*pi,2*pi)
Id=integral(D,-pi,pi)
Ie=integral(E,-pi,pi)
If=integral(F,-pi,pi)