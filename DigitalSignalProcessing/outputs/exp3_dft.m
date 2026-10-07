% Enter exactly N samples. Phase is in degrees.
N = input('N = ');
x = input('x = ');
x = x(:).';
n = 0:N-1;
X = x*exp(-1j*2*pi/N*(n'*n))
magnitude = abs(X)
phase = angle(X)*180/pi
error = max(abs(X-fft(x,N)))
figure;
subplot(3,1,1); stem(n,x);
subplot(3,1,2); stem(n,magnitude);
subplot(3,1,3); stem(n,phase);
