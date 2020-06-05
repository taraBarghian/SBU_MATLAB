clc; clear; close all;

%Polynomial Integration

%First we build the polynomial function using conv()
p = conv([-1, 0, 1], [-1, 0, 1]); %p = (1 - x^2)^2
q = [2, 0, -3, 1];
pq = conv(p, q);  %p.q = ((1 - x^2)^2).(1 - 3x - 2x^3)

%Use polyint to integrate the polynomial
integ = polyint(pq)

%Find the value of the integral by evaluating pq at the limits of integration
a = -2;
b = 3;
I = diff(polyval(integ,[-2 3]))
