
clc;
clear;
close all;

A = 1;
fc = 1000;
Tb = 0.01;
fs = 10000;
Nb = 10;

bits = [1 0 1 1 0 1 0 0 1 1];

Ns = round(fs * Tb);
t = (0:Nb*Ns-1) / fs;

data = repelem(bits, Ns);

carrier = A * cos(2*pi*fc*t);
ask_signal = data .* carrier;

local_carrier = cos(2*pi*fc*t);
mixed_signal = 2 * ask_signal .* local_carrier;

received = reshape(mixed_signal, Ns, Nb);
decision_statistic = mean(received, 1);

threshold = A/2;
recovered_bits = decision_statistic > threshold;

disp('Original bit stream:');
disp(bits);

disp('Recovered bit stream:');
disp(double(recovered_bits));


figure('Name', 'ASK Modulation and Demodulation');

subplot(4,1,1);
stairs(t, data, 'LineWidth', 1.5);
grid on;
ylim([-0.2 1.2]);
title('Original Binary Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4,1,2);
plot(t, carrier);
grid on;
title('Carrier Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4,1,3);
plot(t, ask_signal);
grid on;
title('ASK Modulated Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4,1,4);
stairs((0:Nb-1)*Tb, double(recovered_bits), ...
    'LineWidth', 1.5);
grid on;
ylim([-0.2 1.2]);
title('Recovered Binary Signal');
xlabel('Time (s)');
ylabel('Amplitude');

