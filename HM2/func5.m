function x = func5(a,b,c)
delta=(b^2)- 4*a*c;
if(delta < 0)
    disp("No Roots");
elseif(delta ==0)
    x=(-b/(2*a));
else
    a1= ((-b - sqrt(delta)) / (2*a));
    a2= ((-b + sqrt(delta)) / (2*a));
    x = [a1, a2];
end
    

