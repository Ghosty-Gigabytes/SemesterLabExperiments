clc; clear; close all;
fm = 50;  T = 0.2;
tc = 0:1/20000:T;
xc = cos(2*pi*fm*tc);
fs = [500 100 60];
lab = {'Over-sampling', 'Critical sampling', 'Under-sampling'};
mid = tc >= 0.05 & tc <= 0.15;

subplot(2,2,1); plot(tc, xc, 'LineWidth', 1.5); title('Continuous signal x(t)');
xlabel('Time (s)'); ylabel('Amplitude'); xlim([0 0.08]); grid on;

fprintf('fm = %d Hz, Nyquist rate = %d Hz\n\n', fm, 2*fm);
fprintf('%-8s %-16s %-10s\n', 'fs(Hz)', 'Apparent f (Hz)', 'MSE');
for i = 1:3
    Ts = 1/fs(i);  n = 0:floor(T/Ts);  xs = cos(2*pi*fm*n*Ts);
    xr = xs * sinc((tc - n'*Ts)/Ts);
    fprintf('%-8d %-16d %-10.5f\n', fs(i), abs(fm - round(fm/fs(i))*fs(i)), mean((xc(mid) - xr(mid)).^2));
    subplot(2,2,i+1); plot(tc, xc, 'b', tc, xr, 'g--', 'LineWidth', 1.2); hold on; stem(n*Ts, xs, 'r', 'filled');
    title(sprintf('%s (f_s = %d Hz)', lab{i}, fs(i))); xlabel('Time (s)'); ylabel('Amplitude');
    xlim([0 0.08]); ylim([-1.5 3]); grid on;
    if i == 1, legend('Original', 'Reconstructed', 'Samples', 'Location', 'north'); end
end
