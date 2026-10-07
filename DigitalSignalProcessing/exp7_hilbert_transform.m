clc; clear; close all;
fs = 1000;  t = 0:1/fs:1-1/fs;  N = length(t);
x  = cos(2*pi*50*t);
xh = imag(hilbert(x));
fprintf('Max error between hilbert(x) and sin(2*pi*50*t) = %.2e\n', max(abs(xh - sin(2*pi*50*t))));

H = zeros(1, N);
H(2:N/2) = -1j;
H(N/2+2:N) = 1j;

subplot(2,1,1); plot(t(1:100), x(1:100), 'b', t(1:100), xh(1:100), 'r', 'LineWidth', 1.5);
title('x(t) and its Hilbert transform'); xlabel('Time (s)'); ylabel('Amplitude');
legend('x(t) = cos', 'H[x(t)] = sin'); grid on;
subplot(2,1,2); plot((-N/2:N/2-1)*fs/N, fftshift(angle(H))*180/pi, 'LineWidth', 1.5);
title('Phase of Hilbert transformer H(f)'); xlabel('Frequency (Hz)'); ylabel('Phase (degrees)');
ylim([-120 120]); grid on;
