% Z-transform and Pole-Zero Plot using pzplot


% Clear workspace and command window
clear; clc;

% Example: Discrete-time signal coefficients
% Numerator and denominator coefficients of H(z)
% H(z) = (1 + 0.5 z^-1) / (1 - 0.8 z^-1)
num = [1 0.5];   % Numerator coefficients
den = [1 -0.8];  % Denominator coefficients

% Create discrete-time transfer function with sample time Ts = 1
Ts = 1; % Sampling period
sys = tf(num, den, Ts);

% Plot pole-zero map using pzplot
figure;
pzplot(sys);
grid on;
title('Pole-Zero Map of H(z)');

% Display poles and zeros numerically
disp('Zeros:');
disp(roots(num));
disp('Poles:');
disp(roots(den));
