clc;clear;close all


%example #1
% Create a vector with 5 equal segments from 0 to 0.8
x = linspace(0, 0.8, 6); 
% Calculate the function y
y = (0.2 + 2*x + 90*x.^2 - 120*x.^3 + 25*x.^4);
%Use trapz to integrate the data points
q = trapz(x,y)
%example #1
%range from -10 to 10 incremets by 2
x=[-10:2:10];
%this is our function
y=x.^2;
z=trapz(x,y)