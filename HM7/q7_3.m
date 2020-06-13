%q7_3
%piano keyboard simulation

clc;clear;close all

disp('HOW TO USE: ')
disp('-- Press "1" key to play the sample music --');
disp('--- You can use "0" key to stop the program ---');
disp('---- You can change the instrument with "z" key ----');
disp('----- You can control the volume with "upArrow" and "downArrow" keys -----');
disp('------ The keys to control the piano are: "a,w,s,d,c,f,g,h,j,k,o,l" ------');


waitforbuttonpress;     
ch = get(gcf,'CurrentCharacter');  %  capture the keypress
inst = 0;   % If the variable inst=0, then it is the first instrument. If  inst = 1, then it is the second instrument
z = 1;    % z is the variable for volume
a = 3;    % is the variable for amplitude

music = [32,31,32,31,32,39,30,28,37,28,32,37,39,32,37,39,28,32,31,32,31,32,39,30,28,37,28,32,37,39,32,28,39,37];  % sample music 

while ch ~= '0'    % if we press 0 key, program stops running

if ch == 'a'  % if we press a key, program checks whether we are using the first or the second instrument.Then program assigns the number of the key to the variable x.
    if inst == 0  
      x = 28;
    else
      x = 40;
    end
    
elseif ch == 'w'
    if inst == 0
        x = 29;
    else
        x = 41;
    end
    
elseif ch == 's'
    if inst == 0
        x = 30;
    else
        x = 42;
    end;
    
elseif ch == 'd'
    if inst == 0
        x = 31;
    else
        x = 43;
    end
     
elseif ch == 'c'
    if inst == 0
        x = 32;
    else
        x =44;
    end
    
elseif ch == 'f'
    if inst == 0
        x = 33;
    else
        x = 45;
    end
    
elseif ch == 'g'
    if inst == 0
        x = 34;
    else
        x = 46;
    end

elseif ch == 'h'
    if inst == 0
        x = 35;
    else
        x = 47;
    end
    
elseif ch == 'j'
    if inst == 0
        x = 36;
    else
        x = 48;
    end
 
elseif ch == 'k'
    if inst == 0
        x = 37;
    else
        x = 49;
    end

elseif ch == 'o'
    if inst == 0
        x = 38;
    else
        x = 50;
    end
    
elseif ch == 'l'
    if inst == 0
        x = 39;
    else
        x = 51;
    end
    
elseif ch == '1'  % if the user press the 1 key, then program plays the sample music
    for i=1:1:34 % i is for accessing an element of the music matrix which contains the necessary keys for the sample music
        r = piano(music(i),z,a);  
        sound(r,44100);    
        pause(0.4);    % delays the loop for 0.4 seconds
        
    end


elseif ch == 'z'  % if  we press the z key, then program checks the instrument which we are using, and changes the instrument according to that
    if inst == 0
        inst = 1;
    else
        inst = 0;
    end
    
elseif double(ch) == 31  % if we press the downArrow, program reduces the volume by 0.5
    z = z - 0.5;
    
elseif double(ch) == 30 % if we press the upArrow, program increases the volume by 0.5
    z = z + 0.5;

elseif ch == 'b'  % if we press the b key, program increases the amplitude by 1
    a = a + 1;

elseif ch == 'n' % if we press the n key, program reduces the amplitude by 1
    a = a - 1;
    
end
if ch ~='z' && ch~='0' && ch~='1' && double(ch)~=31 && double(ch)~=30 && ch~='b' && ch~='n' % in this block, program sends the parameters to the piano function, and play the sound with the result of it
    r = piano(x,z,a);
    sound(r,44100);
end
waitforbuttonpress;
ch = get(gcf,'CurrentCharacter');


end


%calculate signals
function [x] = piano(n,q,b)
  
   keyFreq = 2.^((n-1)/12).*27.5;   %formula for the piano key frequencies
   
   fs = 44100; 
   
   t=0:1/fs:2;    % time variable
   
   a = [0.42,0.13,0.02,0.28,0.01];
   
  f1 = a(1).*sin(2.*pi.*keyFreq.*t.*1); % fundamental
  f2 = a(2).*sin(2.*pi.*keyFreq.*t.*2); % harmonic
  f3 = a(3).*sin(2.*pi.*keyFreq.*t.*3); % harmonic
  f4 = a(4).*sin(2.*pi.*keyFreq.*t.*4);
  f5 = a(5).*sin(2.*pi.*keyFreq.*t.*5);
  
   x = q.*exp(-t*b).*(f1+f2+f3+f4+f5);

end
