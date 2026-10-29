%EXP 8_1
clc;
clear all;
close all;

T = 2*pi;
omega = 2*pi/T;
t = linspace(0, 4*pi, 1000);
N = 10;
t_period = linspace(0, T, 1000);

% 2. Re-generate all three waves over the single period [0, T]
sq_wave_period = zeros(size(t_period));
st_wave_period = zeros(size(t_period));
tr_wave_period = zeros(size(t_period));

for n = 1:N
    % Square Wave (Odd harmonics)
    if mod(n, 2) == 1
        sq_wave_period = sq_wave_period + (4 / (n * pi)) * sin(n * omega * t_period);
    end

    % Sawtooth Wave (All harmonics)[cite: 1]
    st_wave_period = st_wave_period + (2 / (n * pi)) * ((-1)^(n+1)) * sin(n * omega * t_period);

    % Triangular Wave (Odd harmonics)[cite: 1]
    if mod(n, 2) == 1
        tr_wave_period = tr_wave_period + (8 / (pi^2)) * ((-1)^((n-1)/2) / (n^2)) * sin(n * omega * t_period);
    end
end

% 3. Initialize amplitude spectrum arrays for each wave
sq_amplitude = zeros(1, N);
st_amplitude = zeros(1, N);
tr_amplitude = zeros(1, N);

% 4. Compute Fourier coefficients and amplitude spectra using trapz
for n = 1:N
    % --- Square Wave Spectrum ---
    a_sq = (2 / T) * trapz(t_period, sq_wave_period .* cos(n * omega * t_period));
    b_sq = (2 / T) * trapz(t_period, sq_wave_period .* sin(n * omega * t_period));
    sq_amplitude(n) = sqrt(a_sq^2 + b_sq^2);

    % --- Sawtooth Wave Spectrum ---
    a_st = (2 / T) * trapz(t_period, st_wave_period .* cos(n * omega * t_period));
    b_st = (2 / T) * trapz(t_period, st_wave_period .* sin(n * omega * t_period));
    st_amplitude(n) = sqrt(a_st^2 + b_st^2);

    % --- Triangular Wave Spectrum ---
    a_tr = (2 / T) * trapz(t_period, tr_wave_period .* cos(n * omega * t_period));
    b_tr = (2 / T) * trapz(t_period, tr_wave_period .* sin(n * omega * t_period));
    tr_amplitude(n) = sqrt(a_tr^2 + b_tr^2);
end

% 5. Plot the Fourier Amplitude Spectra in subplots
figure;

subplot(3, 1, 1);
stem(1:N, sq_amplitude, 'filled', 'LineWidth', 1.2);
title('Square Wave - Fourier Amplitude Spectrum');
xlabel('Harmonic Index (n)');
ylabel('Amplitude');
grid on;

subplot(3, 1, 2);
stem(1:N, st_amplitude, 'filled', 'LineWidth', 1.2);
title('Sawtooth Wave - Fourier Amplitude Spectrum');
xlabel('Harmonic Index (n)');
ylabel('Amplitude');
grid on;

subplot(3, 1, 3);
stem(1:N, tr_amplitude, 'filled', 'LineWidth', 1.2);
title('Triangular Wave - Fourier Amplitude Spectrum');
xlabel('Harmonic Index (n)');
ylabel('Amplitude');
grid on;