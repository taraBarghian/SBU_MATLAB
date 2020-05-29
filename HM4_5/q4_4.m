clc; clear; close all;

N = [1, 5, 11, 13];
D = [1, 2, 4];
fprintf('\nFirst we compute the quotient(Q) and remainder(R) coefficiants: \n');
[Q,R] = deconv(N,D)
fprintf('\n   N(s)/D(s) = Q(s) + R(s)/D(S)\n');
fprintf('\n=> N(s) = Q(s).D(S) + R(s)\n');
fprintf('\n=> s^3 + 5s^2 + 11s + 13 = (s + 3)(s^2 + 2s + 4) + (s + 1)\n');
fprintf('\n\n So we can conclude that the equation written in pdf file true!\n');