%report6 problem6

clc;clear;close all
syms x

expr1 = e^(-3*x);
I1 = int(expr1, 0, 4)

expr2 = e^(-x);
I2 = int(expr1, 0, inf)

expr3 = e^(-(x^2));
I3 = int(expr1, -inf, inf)