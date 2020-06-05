%report6 problem5

clc;clear;close all
syms x y

z = x*y + x^2;  
deri1_z_x = diff(z, x)  % = y + 2x
deri2_z_x = diff(diff(z,x), x)  % = 2
deri1_z_y = diff(z, y)  % = x
deri2_z_y = diff(diff(z,y), y)  % = 0

w = exp(2*x*y) + cos(x/3) + sin(4*y)^2;  
deri1_w_x = diff(w, x)  % = 2ye^(2xy) - (1/3)sin(x/3)
deri2_w_x = diff(diff(w,x), x)  % = 4(y^2)*e^(2xy) - (1/9)cos(x/3)
deri1_w_y = diff(w, y)  % = 2xe^(2xy) - 8sin(4y)cos(4y)
deri2_w_y = diff(diff(w,y), y)  % = 4(x^2)*e^(2xy) - ...
