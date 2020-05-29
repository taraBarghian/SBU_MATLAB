clc; clear; close all;

x = linspace(-8, 8);


%some variables which we need as input
N = 11; k = 3;

%variabls which we should compute
Sn = 0; a0 = 0; an = 0; bn = 0;

%Fourie serie computation
a0 = 0;
an = 0;
for n = 1 : N
    bn = (2 * k) / (n * pi) * (1 - cos(n * pi));
    Sn = Sn + an .* cos(n * x) + bn .* sin(n * x);
end 

%plotting the data
figure(1);
hold on;
f = 2 * k * ((sin(x) > 0) - 0.5); %The main function
plot(x, f);  
plot(x, Sn, 'r');
xlabel('x', 'FontSize', 16);
ylabel('Sn', 'FontSize', 16);
legend('Main Function','Fourie Serie');
title(['Fourie Serie : N = ' num2str(N) '  k = ' num2str(k)], 'FontSize', 16);
axis ([-8, 8, - k - 1, k + 1]);
grid on;
hold off;

%Approximate Erroe Function
e = abs(f - Sn);
figure(2)
plot(x, e);  
xlabel('x', 'FontSize', 16);
ylabel('Error', 'FontSize', 16);
title(['Approximate Error Function : N = ' num2str(N) '  k = ' num2str(k)], 'FontSize', 16);
axis ([-8, 8, 0, 4]);
grid on;
hold off;

%Compute Approximate Error Value
sigma = 0;
for n = 1 : N
    an = 0;
    bn = (2 * k) / (n * pi) * (1 - cos(n * pi));
    sigma = sigma + an ^ 2 + bn ^ 2;
end
fpower2 = @(x) (2 * k * ((sin(x) > 0) - 0.5)) .^ 2; %fpower2 = a function to define f ^ 2 
E = integral(fpower2, -pi, pi) - pi *(2 * a0 ^ 2 + sigma);
fprintf('Approximate Error value for N = %d and k = %d is : %f \n', N, k, E);
%find the least N for E <= 0.001
E = 100;
N = 1;
fprintf('\nCalculating the least N for E <= 0.001. it may takes 30 second or less... \n');
while E > 0.001
    sigma = 0;
    for n = 1 : N
        an = 0;
        bn = (2 * k) / (n * pi) * (1 - cos(n * pi));
        sigma = sigma + an ^ 2 + bn ^ 2;
    end
    E = integral(fpower2, -pi, pi) - pi *(2 * a0 ^ 2 + sigma);
    N = N + 1;
end    
fprintf('\nThe least N for E <= 0.001 is : %d \n', N - 1);




