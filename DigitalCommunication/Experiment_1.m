% Objective: To plot basic signals (Unit Step, Ramp, Impulse, Sinusoidal, Exponential and Square Wave) using MATLAB.

% Time vector for continuous signals
t_cont= -5:0.01:5;
% Discrete time vector for impulse signal
t_disc= -5:1:5;

% 1. Unit Step Signal
subplot(3, 2, 1);
u = t_cont >= 0; % Unit step signal
plot(t_cont, u, "LineWidth", 1.5);
xlabel('Time'); ylabel('Amplitude');
title('Unit Step Signal'); grid on;

% 2. Ramp Signal
subplot(3, 2, 2);
r = t_cont .* (t_cont >= 0); % Ramp signal
plot(t_cont, r, "LineWidth", 1.5);
xlabel("Time"); ylabel("Amplitude");
title("Ramp Signal"); grid on;

% 3. Impulse Signal
subplot(3, 2, 3);
impulse = t_disc == 0; % Impulse Signal
stem(t_disc, impulse, "LineWidth", 1.5);
xlabel("Time"); ylabel("Amplitude");
title("Impulse Signal"); grid on;

% 4. Sinusoidal Signal
subplot(3, 2, 4);
f = 1; a = 1; phi = 0;
y_sin = a * sin(2*pi*f*t_cont + phi);
plot(t_cont, y_sin, "LineWidth", 1.5);
xlabel("Time"); ylabel("Amplitude");
title("Sinusoidal Signal"); grid on;

% 5. Exponential Signal
subplot(3, 2, 5);
alpha = 0.5; % Exponential Growth
y_exp = a * exp(alpha * t_cont);
plot(t_cont, y_exp, "LineWidth", 1.5);
xlabel("Time"); ylabel("Amplitude");
title("Exponential Signal"); grid on;

% 6. Square Wave Signal
subplot(3, 2, 6);
sq = sign(sin(2*pi*t_cont)); % Square wave signal
plot(t_cont, sq, "LineWidth", 1.5);
xlabel('Time'); ylabel('Amplitude');
title('Square Wave Signal'); grid on;
