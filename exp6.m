%EXP=6 study linear convolution
clc;
clear all;
close all;

x = [0 1 2];
h = [-1 0 1];
n1 = [1 2 3];
n2 = [1 2 3];
N1 = length(n1);
N2 = length(n2);

X =[ x,zeros(1,N2-1)];
H = [h,zeros(1,N2-1)];

L = N1+N2-1;
disp("the length of the convolution is:");
disp(L);

y = zeros(1,L);
for i = 1:L
    for j = 1:N1
        if (i-j+1>0) && (i-j+1<=N2)
            y(i) = y(i) + X(j) * H(i-j+1);
        end
    end
end
disp("The convolution result y:");
disp(y);
stem(y,'filled');
xlabel("n");
ylabel("y(n)");
title("Linear Convolution of x(n) and h(n)");
