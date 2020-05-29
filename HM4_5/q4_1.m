%report 4 question 1

clc;clear;close all

p=[1,-2,1];

%return roots
R=roots(p);

%should return p again 
poly11=poly(R);

%polyval checking
x0=[1,0];
y0=polyval(p,x0);

info=["p = "+int2str(p)+" ,roots = "+int2str(R')+" ,poly = "+...
    int2str(poly11)+" ,y0 =  "+ int2str(y0)];
disp(info)