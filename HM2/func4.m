function primeIndex =func4(x)
n=length(x);
primeIndex=[];

for i=1:n    
    if( ~prime(x(i)) )
        primeIndex=[primeIndex,i]; %add accepted index to the array
    end
end
%disp(primeIndex);
end


function flg = prime(n)
flg = false ; %at first we assume it is prime
if( floor(n)==n && n>1)
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
end
