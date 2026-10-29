% EXPERIMENT NO. 5: Comparison of Convolution Results for Different Signal Combinations
clc; clear; close all;

% Define Base Input Signals
rect1 = ones(1, 6);                   % Rectangular Signal 1
rect2 = ones(1, 6);                   % Rectangular Signal 2
tri1  = [1, 2, 3, 2, 1];              % Triangular Signal 1
tri2  = [1, 2, 3, 2, 1];              % Triangular Signal 2

% Compute Convolutions using User-Defined Function
y_rect_rect = Conv_User(rect1, rect2); % Rectangular - Rectangular
y_rect_tri  = Conv_User(rect1, tri1);  % Rectangular - Triangular
y_tri_tri   = Conv_User(tri1, tri2);   % Triangular - Triangular

% Plotting Comparison
figure;

% Case 1: Rectangular - Rectangular
subplot(3,1,1);
stem(y_rect_rect, 'filled');
xlabel("Sample"); ylabel("Amplitude");
title("1. Rectangular * Rectangular -> Triangular Signal");
grid on;

% Case 2: Rectangular - Triangular
subplot(3,1,2);
stem(y_rect_tri, 'filled');
xlabel("Sample"); ylabel("Amplitude");
title("2. Rectangular * Triangular -> Smoothed Trapezoidal Signal");
grid on;

% Case 3: Triangular - Triangular
subplot(3,1,3);
stem(y_tri_tri, 'filled');
xlabel("Sample"); ylabel("Amplitude");
title("3. Triangular * Triangular -> Bell-Shaped Signal");
grid on;

% User-Defined Convolution Function Definition
function y = Conv_User(x, h)
N1 = length(x);
N2 = length(h);
Ny = N1 + N2 - 1;
y = zeros(1, Ny);

for n = 1:Ny
    for k = 1:N1
        if (n - k + 1) > 0 && (n - k + 1) <= N2
            y(n) = y(n) + x(k) * h(n - k + 1);
        end
    end
end
end