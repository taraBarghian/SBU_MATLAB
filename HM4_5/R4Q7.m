%report 4 problem 7
clear;clc;close all

b = [1 2];
a = [1 4 3 0];
[r,p,k] = residue(b,a);

%print in good format :))
disp("r=");
disp(r');

disp("p=");
disp(p');

disp("k=");
disp(k'); % actually its []

