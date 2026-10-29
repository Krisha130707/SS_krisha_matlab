clc;
clear all;
close all;

T = 2*pi;
omega = 2*pi/T;
t = linspace(0, 4*pi, 1000);
N = 10;
st_wave = zeros(size(t));
for n=1:N
    if mod(n,2) ==1
        st_wave = st_wave + (2/(n*pi)) * ((-1)^(n+1))*sin(n*omega*t) ;
        plot(t, st_wave, 'LineWidth', 1.5);
        hold on;
    end
end
figure;
plot(t, st_wave, 'LineWidth', 1.5);
grid on;
xlabel('Time');
ylabel('Amplitude');
title('Fourier Series Approximation of a Sawtooth Wave');



