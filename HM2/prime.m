
function flg = prime(n)
flg = false ; %at first we assume it is prime
if( floor(n)==n && n>0)
    %%% natural number 
    for i=2:(n/2)
        if( rem(n,i) == 0)
            flg=true;
            break;
        end
    end 
else
    flg=true;
end