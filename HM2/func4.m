function primeIndex =func4(x)
n=length(x);
primeIndex=[];

for i=1:n    
    if( ~prime(x(i)) )
        primeIndex=[primeIndex,i];
    end
end
%disp(primeIndex);
end