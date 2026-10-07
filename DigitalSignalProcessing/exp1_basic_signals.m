clc; clear; close all;
t = (-20000:40000)*1e-4;
x = {(t>=0 & t<0.0499)/0.05, double(t>=0), t.*(t>=0), exp(-2*t).*(t>=0), exp(0.5*t).*(t>=0), double(abs(t)<=0.5)};
s = {'Unit Impulse \delta(t)', 'Unit Step u(t)', 'Unit Ramp r(t)', 'Decaying Exponential e^{-2t}u(t)', 'Growing Exponential e^{0.5t}u(t)', 'Rectangular Pulse'};
figure(1);
for i = 1:6
    subplot(3,2,i); plot(t, x{i}, 'LineWidth', 1.5); title(s{i});
    xlabel('Time (s)'); ylabel('Amplitude'); ylim([-0.1 1.1]*max(x{i})); grid on;
end

tp = (0:2999)*1e-5;
w = 100*tp;
saw = 2*(w - floor(w + 1e-9)) - 1;
y = {sin(2*pi*w), cos(2*pi*w), 2*(mod(floor(2*w + 1e-9), 2) == 0) - 1, saw, 2*abs(saw) - 1, exp(-100*tp).*sin(2*pi*w)};
s = {'Sine Wave', 'Cosine Wave', 'Square Wave', 'Sawtooth Wave', 'Triangular Wave', 'Damped Sinusoid e^{-100t}sin(2\pi f_0 t)'};
figure(2);
for i = 1:6
    subplot(3,2,i); plot(tp, y{i}, 'LineWidth', 1.5); title(s{i});
    xlabel('Time (s)'); ylabel('Amplitude'); ylim([-1.2 1.2]); grid on;
end

fprintf('Energy of e^(-2t)u(t), numerical     = %.4f\n', trapz(t, x{4}.^2));
fprintf('Energy of e^(-2t)u(t), theory 1/(2a) = %.4f\n\n', 1/4);
fprintf('Average power of sine wave           = %.4f\n', mean(y{1}.^2));
fprintf('Average power of square wave         = %.4f\n', mean(y{3}.^2));
fprintf('Average power of sawtooth wave       = %.4f\n', mean(y{4}.^2));
fprintf('Average power of triangular wave     = %.4f\n', mean(y{5}.^2));
