clc;
clear;
close all;


t = 0:0.001:1;
f = 10;
x = sin(2*pi*f*t);
xh = hilbert(x);

subplot(3,1,1);
plot(t,x);
title('Original Signal');
xlabel('Time');
ylabel('Amplitude');
grid on;
subplot(3,1,2);
plot(t,imag(xh));
title('Hilbert Transform');
xlabel('Time');
ylabel('Amplitude');
grid on;
subplot(3,1,3);
plot(t,abs(xh));
title('Envelope of Signal');
xlabel('Time');
ylabel('Amplitude');
grid on;