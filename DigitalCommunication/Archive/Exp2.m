% Experiment 1: Convert analog to digital signal in matlab
clc
clear
close all

t = 0:0.001:1;
x = sin(2*pi*5*t);

Fs = 50;
ts = 0:1/Fs:1;
xs = sin(2*pi*5*ts);

L = 16;
xmin = -1;
xmax = 1;
q = (xmax - xmin)/(L-1);
xq = round((xs - xmin)/q)*q + xmin;

figure

subplot(3,1,1)
plot(t,x,'b','LineWidth',2)
grid on
xlabel('Time (s)')
ylabel('Amplitude')
title('Analog Signal')

subplot(3,1,2)
stem(ts,xs,'Marker','none')
grid on
xlabel('Time (s)')
ylabel('Amplitude')
title('Sampled Signal')

subplot(3,1,3)
stem(ts,xq,'Marker','none')
grid on
xlabel('Time (s)')
ylabel('Amplitude')
title('Quantized Signal (16 Levels)')