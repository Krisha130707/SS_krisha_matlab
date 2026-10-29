clc;
close all;
clear all;

%% 1. EXPONENTIAL SIGNAL & FOURIER TRANSFORM
t = 0:0.01:1;
a = 0.5;
x_t_exp = a.^t;

figure(1);
plot(t, x_t_exp);
title('1. Exponential Signal in Time Domain');
xlabel('Time (s)');
ylabel('Amplitude');

w = -2*pi:0.01:2*pi;
x_w_exp = zeros(size(w));
for k = 1:length(w)
    x_w_exp(k) = trapz(t, x_t_exp .* exp(-j * w(k) * t));
end

figure(2);
plot(w, abs(x_w_exp));
title('Magnitude Spectrum of Exponential Signal');
xlabel('Frequency (rad/s)');
ylabel('Magnitude');

figure(3);
plot(w, angle(x_w_exp));
title('Phase Spectrum of Exponential Signal');
xlabel('Frequency (rad/s)');
ylabel('Phase (radians)');


%% 2. SINE SIGNAL & FOURIER TRANSFORM
f = 5; % Frequency
x_t_sine = sin(2 * pi * f * t);

figure(4);
plot(t, x_t_sine);
title('2. Sine Signal in Time Domain');
xlabel('Time (s)');
ylabel('Amplitude');

x_w_sine = zeros(size(w));
for k = 1:length(w)
    x_w_sine(k) = trapz(t, x_t_sine .* exp(-j * w(k) * t));
end

figure(5);
plot(w, abs(x_w_sine));
title('Magnitude Spectrum of Sine Signal');
xlabel('Frequency (rad/s)');
ylabel('Magnitude');

figure(6);
plot(w, angle(x_w_sine));
title('Phase Spectrum of Sine Signal');
xlabel('Frequency (rad/s)');
ylabel('Phase (radians)');


%% 3. RECTANGULAR PULSE SIGNAL & FOURIER TRANSFORM
x_t_rect = (t >= 0.3 & t <= 0.7);

figure(7);
plot(t, x_t_rect);
title('3. Rectangular Pulse in Time Domain');
xlabel('Time (s)');
ylabel('Amplitude');
ylim([-0.2 1.2]);

x_w_rect = zeros(size(w));
for k = 1:length(w)
    x_w_rect(k) = trapz(t, x_t_rect .* exp(-j * w(k) * t));
end

figure(8);
plot(w, abs(x_w_rect));
title('Magnitude Spectrum of Rectangular Pulse');
xlabel('Frequency (rad/s)');
ylabel('Magnitude');

figure(9);
plot(w, angle(x_w_rect));
title('Phase Spectrum of Rectangular Pulse');
xlabel('Frequency (rad/s)');
ylabel('Phase (radians)');