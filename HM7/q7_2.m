
%q7_2: to input an audio(DTMF signal) and decode to analogous string
clc; clear; close all

%some preprocessing to prepare data

f1 = 'char';
f2 = 'first';
f3 = 'second';

DTMF_table(1) = struct(f1, '1', f2, 697, f3, 1209);
DTMF_table(2) = struct(f1, '2', f2, 697, f3, 1336);
DTMF_table(3) = struct(f1, '3', f2, 697, f3, 1477);
DTMF_table(4) = struct(f1, '4', f2, 770, f3, 1209);
DTMF_table(5) = struct(f1, '5', f2, 770, f3, 1336);
DTMF_table(6) = struct(f1, '6', f2, 770, f3, 1477);
DTMF_table(7) = struct(f1, '7', f2, 852, f3, 1209);
DTMF_table(8) = struct(f1, '8', f2, 852, f3, 1336);
DTMF_table(9) = struct(f1, '9', f2, 852, f3, 1477);
DTMF_table(10) = struct(f1, '0', f2, 941, f3, 1336);
DTMF_table(11) = struct(f1, 'A', f2, 697, f3, 1633);
DTMF_table(12) = struct(f1, 'B', f2, 770, f3, 1633);
DTMF_table(13) = struct(f1, 'C', f2, 852, f3, 1633);
DTMF_table(14) = struct(f1, 'D', f2, 941, f3, 1633);
DTMF_table(15) = struct(f1, '*', f2, 941, f3, 1209);
DTMF_table(16) = struct(f1, '#', f2, 941, f3, 1477);

save("DTMF_keypad_f", "DTMF_table");


%prepare DTMF table as .mat file
x  = [697, 770, 852, 941];
y = [1209, 1336, 1477, 1633];

mat = [['1', '2', '3', 'A'];
       ['4', '5', '6', 'B'];
       ['7', '8', '9', 'C'];
       ['*', '0', '#', 'D']];
   
save("decode")


% reading the filepath from the prompt and reading the audiofile
audioName = input("Enter the file path: ", 's');
disp('Wait for the process to complete');
%audioName = 'Test_DTMF.wav';
[tone, Fs] = audioread(audioName);
info = audioinfo(audioName);

load("decode.mat")
% trying to devide the whole voice to envelopes
env = envelope(tone,80,'rms');
[w, s, e] = pulsewidth(env,Fs);
s = [[.001]; s];
e = [s(2); e];
s = round(s * Fs);
e = round(e * Fs);

f = [x , y];
tones = cell(size(s));
for i = 1:size(s)
    tones(i,:) = {tone(s(i):e(i))};
end

for i=1:size(s)
    freq_indices = round(f./Fs*size(tones{i}, 1)) + 1; 
    dft_data = abs(goertzel(tones{i},freq_indices));
    [val, ind] = maxk(dft_data, 2);
    if (ind(1) > ind(2))
       disp(mat(ind(2),ind(1)-4))
    else
       disp(mat(ind(1),ind(2)-4))
    end
    disp("---------")
    
    stem(f,abs(dft_data))
    ax = gca;
    ax.XTick = f;
    xlabel('Frequency (Hz)')
    title('DFT Magnitude')
    
    pause(1);
end

disp('done')
