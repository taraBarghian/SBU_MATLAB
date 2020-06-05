clc;clear;
syms x
%first we make our function the find the limit of it by two given number
%2+,2-,3+,3-
f=((x^2-4)^2)/((x-2)*(x-3));
limit(f,x,2,'right')
limit(f,x,2,'left')
limit(f,x,3,'right')
limit(f,x,3,'left')
