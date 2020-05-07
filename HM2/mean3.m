
function [arithmetic,geometric,harmonic]=mean3(a,b)
arithmetic=(a+b)/2;
geometric=sqrt(a*b);
harmonic=((a.^(-1) + b.^(-1) )/2).^(-1); %Harmonic mean
end
