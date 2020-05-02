%Q12
clear
clc

name=input("Enter your name: ", 's');
format= input("Which format do you prefer? \n 1 for UpperCase \n 0 for LowerCase: ");

if(format)
    name = upper(name);
else
    name = lower(name);
end

disp(name);