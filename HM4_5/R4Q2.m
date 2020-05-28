%report 4 question 2

clc;clear;close all

p=input("Enter a row vectors containing coefficients : ");

%return roots
R=roots(p);
disp("number of roots = "+length(R))
