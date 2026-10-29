clc;
clear all;
close all;

T = 2*pi;
omega = 2*pi/T;
t = linspace(0, 4*pi, 1000);
N = 10;
tr_wave = zeros(size(t));
for n=1:N
    if mod(n,2) ==1
        tr_wave = tr_wave + (8/(pi^2)) * (((-1)^(n-1)/2)/(n^2)) *sin(n*omega*t) ;
        plot(t, tr_wave, 'LineWidth', 1.5);
        hold on;
    end
end
figure;
plot(t, tr_wave, 'LineWidth', 1.5);
grid on;
xlabel('Time');
ylabel('Amplitude');
title('Fourier Series Approximation of a trigular Wave');



