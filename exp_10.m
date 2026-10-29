

clc; clear; close all;

%% 1. System and input
h = [1 2 1];
x = [1 -1 2 -2 3];
y = conv(x, h);                 % y[n] = x[n]*h[n]
disp('y[n] ='); disp(y);

%% 2. Inverse system
% H(z) = 1 + 2z^-1 + z^-2 = (1 + z^-1)^2  -> double zero at z = -1
% 1/H(z) = 1/(1+z^-1)^2  -> h_inv[n] = (n+1)(-1)^n u[n]
L = 20;
n = 0:L-1;
h_inv = (n+1).*(-1).^n;         % truncated to L samples
chk = conv(h, h_inv);
disp('h * h_inv (first L samples) ='); disp(chk(1:L));   % 1 0 0 0 ...

%% 3. Noise-free deconvolution
x_rec = deconv(y, h);
disp('Recovered x[n] (no noise) ='); disp(x_rec);

%% 4. Add 1% noise
rng(1);
yn = y + 0.01*max(abs(y))*randn(size(y));

% (a) Direct deconvolution (polynomial division / inverse filter)
x_dir = deconv(yn, h);

% (b) Direct deconvolution in frequency domain
N  = 101;                       % odd N avoids exact zero of H at w = pi
H  = fft(h, N);
Yn = fft(yn, N);
x_fd = real(ifft(Yn ./ H));
x_fd = x_fd(1:length(x));

% (c) Regularized (Tikhonov) deconvolution
lambda = 0.05;
x_reg = real(ifft(Yn .* conj(H) ./ (abs(H).^2 + lambda)));
x_reg = x_reg(1:length(x));

%% 5. Error comparison
err = @(xe) norm(xe - x);
fprintf('\nNoise-free error          : %.4e\n', err(x_rec));
fprintf('Direct (deconv) error     : %.4f\n', err(x_dir));
fprintf('Direct (FFT) error        : %.4f\n', err(x_fd));
fprintf('Regularized (FFT) error   : %.4f\n', err(x_reg));
fprintf('min|H(w)| = %.4e,  max amplification 1/min|H| = %.1f\n', ...
    min(abs(H)), 1/min(abs(H)));

%% 6. Plots
figure;
subplot(3,2,1); stem(0:4, x,'filled'); title('Original x[n]'); grid on;
subplot(3,2,2); stem(0:6, y,'filled'); hold on; stem(0:6, yn,'r');
title('y[n] (blue) and noisy y[n] (red)'); grid on;
subplot(3,2,3); stem(0:L-1, h_inv,'filled'); title('Inverse h_{inv}[n] (grows!)'); grid on;
subplot(3,2,4); w = linspace(0,pi,512); plot(w, abs(freqz(h,1,w)));
title('|H(e^{j\omega})| -> 0 at \omega=\pi'); xlabel('\omega'); grid on;
subplot(3,2,5); stem(0:4, x,'k'); hold on; stem(0:4, x_fd,'r'); stem(0:4, x_reg,'b');
legend('Original','Direct','Regularized'); title('Recovery from noisy y[n]'); grid on;
subplot(3,2,6); zplane(h,1); title('Zeros of H(z): double zero at z=-1');