
clc;
clear;
close all;

%% Parameters
N = 1000;              % Number of bits
Tb = 1;                % Bit duration
fc = 5;                % Carrier frequency
Fs = 100;              % Sampling frequency
SNR_dB = 10;            % Signal-to-noise ratio in dB

t = 0:1/Fs:Tb-1/Fs;     % Time vector for one bit
L = length(t);          % Samples per bit

%% 1. Generate random binary data
bits = randi([0 1], 1, N);

%% 2. BPSK Modulation
% Map bit 1 -> +1, bit 0 -> -1
symbols = 2*bits - 1;

% Carrier signal
carrier = cos(2*pi*fc*t);

% Generate BPSK waveform
tx = zeros(1, N*L);

for i = 1:N
    tx((i-1)*L+1:i*L) = symbols(i) * carrier;
end

%% 3. Add AWGN noise
signal_power = mean(tx.^2);
SNR_linear = 10^(SNR_dB/10);
noise_power = signal_power / SNR_linear;

noise = sqrt(noise_power) * randn(size(tx));
rx = tx + noise;

%% 4. Coherent Demodulation
% Correlate each received bit with the carrier
rx_bits = zeros(1, N);

for i = 1:N
    idx = (i-1)*L+1:i*L;
    correlation = sum(rx(idx) .* carrier);

    if correlation > 0
        rx_bits(i) = 1;
    else
        rx_bits(i) = 0;
    end
end

%% 5. Calculate BER
errors = sum(bits ~= rx_bits);
BER = errors/N;

fprintf('SNR = %.2f dB\n', SNR_dB);
fprintf('Total bit errors = %d\n', errors);
fprintf('Bit Error Rate (BER) = %.6f\n', BER);

%% 6. Plot results
figure;

subplot(4,1,1);
stairs(bits(1:10), 'LineWidth', 1.5);
title('Transmitted Binary Data');
xlabel('Bit Index');
ylabel('Bit');
ylim([-0.2 1.2]);
grid on;

subplot(4,1,2);
plot(tx(1:10*L), 'LineWidth', 1.2);
title('BPSK Modulated Signal');
xlabel('Sample Index');
ylabel('Amplitude');
grid on;

subplot(4,1,3);
plot(rx(1:10*L), 'LineWidth', 1);
title('Received Signal with AWGN');
xlabel('Sample Index');
ylabel('Amplitude');
grid on;

subplot(4,1,4);
stairs(rx_bits(1:10), 'LineWidth', 1.5);
title('Demodulated Binary Data');
xlabel('Bit Index');
ylabel('Bit');
ylim([-0.2 1.2]);
grid on;

