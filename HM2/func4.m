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