
clc;
clear;
close all;

A = 1;
f1 = 1000;
f0 = 500;
Tb = 0.01;
fs = 10000;

bits = [1 0 1 1 0 1 0 0 1 1];
Nb = length(bits);

Ns = round(fs * Tb);
t = (0:Nb*Ns-1) / fs;

data = repelem(bits, Ns);

carrier1 = A * cos(2*pi*f1*t);
carrier0 = A * cos(2*pi*f0*t);

bfsk_signal = data .* carrier1 + (1-data) .* carrier0;

r = reshape(bfsk_signal, Ns, Nb);
c1 = reshape(carrier1, Ns, Nb);
c0 = reshape(carrier0, Ns, Nb);

z1 = sum(r .* c1, 1);
z0 = sum(r .* c0, 1);

recovered_bits = z1 > z0;

disp('Transmitted binary data:');
disp(bits);

disp('Recovered binary data:');
disp(double(recovered_bits));

if isequal(bits, double(recovered_bits))
    disp('Verification successful: Data matches.');
else
    disp('Verification failed: Data does not match.');
end

figure;

subplot(4,1,1);
stairs(t, data, 'LineWidth', 1.5);
grid on;
ylim([-0.2 1.2]);
title('Transmitted Binary Data');
xlabel('Time (s)');
ylabel('Bit');

subplot(4,1,2);
plot(t, carrier1);
grid on;
title('Carrier for Binary 1');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4,1,3);
plot(t, bfsk_signal);
grid on;
title('BFSK Modulated Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4,1,4);
stairs((0:Nb-1)*Tb, double(recovered_bits), ...
    'LineWidth', 1.5);
grid on;
ylim([-0.2 1.2]);
title('Recovered Binary Data');
xlabel('Time (s)');
ylabel('Bit');

