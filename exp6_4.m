clc;
clear all;
close all;

x = [1 1 -1 0];
h = [1 0 1 0];

N1 = length(x);
N2 = length(h);

L = N1 + N2 - 1;

disp("The length of the convolution is:");
disp(L);

y = zeros(1,L);

for i = 1:L
    for j = 1:N1
        if (i-j+1 > 0) && (i-j+1 <= N2)
            y(i) = y(i) + x(j) * h(i-j+1);
        end
    end
end

disp("The convolution result y:");
disp(y);

stem(0:L-1,y,'filled');
xlabel("n");
ylabel("y(n)");
title("Linear Convolution of x(n) and h(-n)");
grid on;