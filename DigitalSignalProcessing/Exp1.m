% Experiment 1: Implement Unit Impulse, Unit Step, Ramp, Sine, Cosine, Scalar and Exponential Signal in Matlab
clc;
clear;
close all;

t = -5:0.01:5;

% Signals
impulse = (t == 0);
step = (t >= 0);
ramp = t .* (t >= 0);
sine_signal = sin(2*pi*t);
cosine_signal = cos(2*pi*t);
scalar = 5 * ones(size(t));
exponential = exp(t);

figure;

subplot(4,2,1);
stem(t, impulse, 'filled');
title('Unit Impulse');
xlabel('Time');
ylabel('Amplitude');
grid on;

subplot(4,2,2);
plot(t, step);
title('Unit Step');
xlabel('Time');
ylabel('Amplitude');
grid on;

subplot(4,2,3);
plot(t, ramp);
title('Unit Ramp');
xlabel('Time');
ylabel('Amplitude');
grid on;

subplot(4,2,4);
plot(t, sine_signal);
title('Sine');
xlabel('Time');
ylabel('Amplitude');
grid on;

subplot(4,2,5);
plot(t, cosine_signal);
title('Cosine');
xlabel('Time');
ylabel('Amplitude');
grid on;

subplot(4,2,6);
plot(t, scalar);
title('Scalar Function');
xlabel('Time');
ylabel('Amplitude');
grid on;

subplot(4,2,7);
plot(t, exponential);
title('Exponential');
xlabel('Time');
ylabel('Amplitude');
grid on;
