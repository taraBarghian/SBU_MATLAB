

clc;clear;close all

fr = [697 770 852 941];
fc = [1209 1336 1477 1633];

s = input('Enter your phone number: ','s');
s_size = length(s);

for i=1:s_size
    switch s(i)
         case 'A', k = 1; j = 4;
         case 'B', k = 2; j = 4;
         case 'C', k = 3; j = 4;
         case 'D', k = 4; j = 4;
         case '*', k = 4; j = 1;
         case '0', k = 4; j = 2;
         case '#', k = 4; j = 3;
         otherwise,
            d = s(i)-'0'; j = mod(d-1,3)+1; k = (d-j)/3+1;
    end
    
    
    Fs = 16000;
    t = 0:1/Fs:0.3;
    y1 = sin(2*pi*fr(k)*t);
    y2 = sin(2*pi*fc(j)*t);
    y = (y1 + y2);

    soundsc(y,Fs)
    pause(0.15)

end
