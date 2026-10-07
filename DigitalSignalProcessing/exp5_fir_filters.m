clc; clear; close all;
fs = 1000;  fp = 200;  fst = 300;  M = 60;
Wn = (fp + fst)/fs;
names = {'Rectangular', 'Triangular', 'Hanning', 'Hamming', 'Blackman'};
w = [rectwin(M+1) triang(M+1) hann(M+1) hamming(M+1) blackman(M+1)];

for i = 1:5
    [HL(:,i), f] = freqz(fir1(M, Wn, 'low',  w(:,i)), 1, 512, fs);
    HH(:,i)      = freqz(fir1(M, Wn, 'high', w(:,i)), 1, 512, fs);
end
GL = 20*log10(abs(HL) + eps);
GH = 20*log10(abs(HH) + eps);
ripple = max(abs(GL(f <= fp, :)));
atten  = -max(GL(f >= fst, :));

fprintf('%-13s %-22s %-22s\n', 'Window', 'Pass-band ripple (dB)', 'Stop-band atten. (dB)');
for i = 1:5
    fprintf('%-13s %-22.3f %-22.2f\n', names{i}, ripple(i), atten(i));
end

subplot(2,1,1); plot(f, GL, 'LineWidth', 1.2); title('FIR low-pass filter');
xlabel('Frequency (Hz)'); ylabel('Gain (dB)'); axis([0 500 -120 5]); grid on;
legend(names, 'Location', 'southwest');
subplot(2,1,2); plot(f, GH, 'LineWidth', 1.2); title('FIR high-pass filter');
xlabel('Frequency (Hz)'); ylabel('Gain (dB)'); axis([0 500 -120 5]); grid on;
