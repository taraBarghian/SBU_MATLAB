%Q13
clear
clc

vec1=input("first vector: ");
vec2=input("second vector: ");

L1=length(vec1);
L2=length(vec2);

if(L1==L2)
    
   dots=dot(vec1, vec2);
   norms=norm(vec1)*norm(vec2);
   
   cosTheta = dots/norms;
   thetaInDegrees = real(acosd(cosTheta));
   
   disp(thetaInDegrees);
else
    disp("Different Lengths");
end
