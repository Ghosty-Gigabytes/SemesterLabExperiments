% Experiment 5a: Implement Matlab code for pulse code modulation and DCM
clc; clear; close all;

fm = 10; fs = 1000; n = 3; L = 2^n;
t = 0:1/fs:1;
x = sin(2*pi*fm*t);

xmin = -1; xmax = 1;
q = (xmax - xmin)/L;

xq = q*floor((x-xmin)/q) + xmin + q/2;
xq(xq > xmax) = xmax - q/2;
xq(xq < xmin) = xmin + q/2;

indices = floor((xq-xmin)/q);
indices(indices >= L) = L-1;
indices(indices < 0) = 0;
pcm = dec2bin(indices, n);

fprintf('PCM Codes:\n\n');
for i = 1:min(20, length(x))
    fprintf('Sample %2d: %.4f -> %.4f -> %s\n', i, x(i), xq(i), pcm(i,:));
end

err = x - xq;
fprintf('\nQuantization Levels : %d\n', L);
fprintf('Bits per Sample     : %d\n', n);
fprintf('MSE                 : %.6f\n', mean(err.^2));

figure;
subplot(3,1,1);
plot(t, x); grid on;
title('Original Signal'); xlabel('Time'); ylabel('Amplitude');

subplot(3,1,2);
stem(t(1:50), x(1:50)); grid on;
title('Sampled Signal'); xlabel('Time'); ylabel('Amplitude');

subplot(3,1,3);
stairs(t(1:50), xq(1:50)); grid on;
title('Quantized Signal'); xlabel('Time'); ylabel('Amplitude');
