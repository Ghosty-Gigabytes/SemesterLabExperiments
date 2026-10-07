clc; clear; close all;
N = input('Enter the number of points of the DFT, N = ');
x = input('Enter the sequence x(n) = ');
x = [x zeros(1, N-length(x))];
n = 0:N-1;
X = x * exp(-1j*2*pi/N).^(n'*n);

fprintf('\n%3s %22s %12s %14s\n', 'k', 'X(k)', '|X(k)|', 'Phase (deg)');
for k = n
    fprintf('%3d %11.4f %+10.4fj %12.4f %14.4f\n', k, real(X(k+1)), imag(X(k+1)), abs(X(k+1)), angle(X(k+1))*180/pi);
end
fprintf('\nMax difference between this DFT and fft = %.2e\n', max(abs(X - fft(x, N))));

subplot(3,1,1); stem(n, x, 'filled'); title('Input sequence x(n)'); xlabel('n'); ylabel('x(n)'); grid on;
subplot(3,1,2); stem(n, abs(X), 'filled'); title('Magnitude spectrum'); xlabel('k'); ylabel('|X(k)|'); grid on;
subplot(3,1,3); stem(n, angle(X)*180/pi, 'filled'); title('Phase spectrum'); xlabel('k'); ylabel('Phase (degrees)'); grid on;
