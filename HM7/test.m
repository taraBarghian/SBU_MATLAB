Fs = 16000; % Hz
Length = 2; % Sec
t = 0 : 1/Fs : Length;
x1=sin(2*pi*400*t);x2=0.7*sin(2*pi*900*t);x3=0.4*sin(2*pi*2000*t);
x4=x2+x3;
bin_frequency=1:floor(length(t)/2);
f=((bin_frequency-1)/length(bin_frequency))*Fs/2;
X1=abs(fft(x1));
X2=abs(fft(x2));
X3=abs(fft(x3));
X4=abs(fft(x4));
subplot(1,2,1)
plot(t(1:150),x4(1:150))
xlabel('Time (Sec)')
ylabel('x4(t)=x2(t)+x3(t)')
grid
subplot(122)
plot(f,X4(bin_frequency))
xlabel('Frequency (Hz)')
ylabel('|X4(f)|')
grid