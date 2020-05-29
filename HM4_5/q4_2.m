%report 4 question 2

clc; clear; close all;

%compute the number of the real and imaginary roots of a polynomial function

coeff = input('Enter the coefficients of the the polynomial function: ');
r = roots(coeff);
isReal = (imag(r) == 0); %create a boolean vector which determins the roots are real or not
fprintf('\nNumber of real roots : %d \n', sum(isReal));
fprintf('\nAnd the number of imanginary roots is : %d \n', size(r, 1) - sum(isReal));