clear;clc;close all

x=input("Enter 2 numbers in the form of a vector \n [a,b]:  ");
y=input("which kind of mean do you want? \n arithmetic 0; \n geometric  1; \n harmonic   2: ");

[a,g,h]=mean3(x(1),x(2));

if(y==0)
    disp(a);
elseif (y==1) 
    disp(g);
elseif(y==2)
    disp(h);
else
    disp("invalid input")
end