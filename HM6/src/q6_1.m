
%q6_6
clc;clear;close all

syms x;
%assume(x<5 | x>-5 )
assumeAlso( x/2 , 'integer')
assumeAlso(x~=0)
assumptions
solve(x<5,x>-5,x) %print even numbers in (-5,5) but 0 