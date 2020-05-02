% Q11 , prime numbers
clear
clc

n = input("Enter a number ? ");
flg = false ; %at first we assume it is prime

if( floor(n)==n && n>0)
    %%% natural number 
    for i=2:(n/2)
        if( rem(n,i) == 0)
            flg=true;
            break;
        end
    end
    if(flg)
        disp("Not Prime");
    else
        disp("Prime");
    end
  %%%  otherwise
else
    disp("input does not match");
end

    