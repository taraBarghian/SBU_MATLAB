%q6_3

clc;clear; close all

%Find all symbolic variables in an expression. symvar returns the variables in alphabetical order.

syms  a b c d e
avr = (a+b+c+d+e)/5;
symvar(avr)


%Find the first three symbolic variables in an expression. 
%symvar chooses variables that are alphabetically closest to x and returns them in alphabetical order.

syms a b x y z
f = cos(a)*exp(x^2/(sin(3*y-b)))+z;
symvar(f,3)