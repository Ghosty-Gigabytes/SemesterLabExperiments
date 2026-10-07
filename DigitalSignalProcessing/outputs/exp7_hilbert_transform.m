% xa: analytic signal; xh: Hilbert transform; phase is in degrees.
fs = 1000;
t = 0:1/fs:1-1/fs;
N = length(t);
x = cos(2*pi*50*t);
xa = hilbert(x);
xh = imag(xa);
error = max(abs(xh-sin(2*pi*50*t)))
H = zeros(1,N);
H(2:N/2) = -1j;
H(N/2+2:N) = 1j;
figure;
subplot(2,1,1); plot(t(1:100),x(1:100),t(1:100),xh(1:100));
subplot(2,1,2); plot((-N/2:N/2-1)*fs/N,fftshift(angle(H))*180/pi);
