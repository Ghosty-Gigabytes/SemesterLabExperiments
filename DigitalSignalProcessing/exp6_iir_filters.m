clc; clear; close all;
c   = input('Enter choice of filter  1. LPF  2. HPF : ');
Rp  = input('Enter the pass-band ripple Rp (dB) = ');
Rs  = input('Enter the stop-band attenuation Rs (dB) = ');
fp  = input('Enter the pass-band edge frequency (Hz) = ');
fst = input('Enter the stop-band edge frequency (Hz) = ');
fs  = input('Enter the sampling frequency (Hz) = ');

[N, Wn] = buttord(fp/(fs/2), fst/(fs/2), Rp, Rs);
type = {'low', 'high'};
[b, a] = butter(N, Wn, type{c});
[H, f] = freqz(b, a, 1024, fs);
G = 20*log10(abs(freqz(b, a, [fp fst], fs)));

fprintf('\nOrder N = %d, cut-off = %.1f Hz\n', N, Wn*fs/2);
fprintf('Gain at %d Hz = %.2f dB\n', fp, G(1));
fprintf('Gain at %d Hz = %.2f dB\n', fst, G(2));

t = 0:1/fs:0.05;
x = sin(2*pi*(fs/16)*t) + sin(2*pi*(0.45*fs)*t);
y = filter(b, a, x);

subplot(3,1,1); plot(f, 20*log10(abs(H) + eps), 'LineWidth', 1.5); title('Magnitude response');
xlabel('Frequency (Hz)'); ylabel('Gain (dB)'); axis([0 fs/2 -100 5]); grid on;
subplot(3,1,2); plot(t, x, 'LineWidth', 1.2); title('Input sequence');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;
subplot(3,1,3); plot(t, y, 'LineWidth', 1.2); title('Output sequence');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;
