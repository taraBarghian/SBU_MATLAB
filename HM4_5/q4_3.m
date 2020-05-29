%report 4 question 3

clc;clear;close all

p1 = [1 -2 1];
p2 = [1 -1];
p3=deconv(p1,p2);
p4=conv(p2,p3);

disp("deconv vector = ");
disp(p3);
disp("\nconv vector = ");
disp(p4);