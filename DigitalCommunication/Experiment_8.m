% Objective: To simulate and implement Adaptive Delta Modulation (ADM) using MATLAB and Simulink.

clc; clear; close all;

% Continuous signal
A = 5; f = 2;
t = 0:0.001:2;
x = A*sin(2*pi*f*t);

% Sampling
Fs = 20;
ts = 0:1/Fs:2;
xs = A*sin(2*pi*f*ts);

% Adaptive Delta Modulation
delta = 0.5;      % Initial step size
delta_min = 0.1;
delta_max = 2;
dm = zeros(size(xs));
bits = zeros(size(xs));
step = zeros(size(xs));
step(1) = delta;

for i = 2:length(xs)
    if xs(i) >= dm(i-1)
        bits(i) = 1;
        dm(i) = dm(i-1) + step(i-1);
    else
        bits(i) = 0;
        dm(i) = dm(i-1) - step(i-1);
    end
    % Adapt step size
    if i > 2
        if bits(i) == bits(i-1)
            step(i) = min(step(i-1)*1.5, delta_max);
        else
            step(i) = max(step(i-1)/1.5, delta_min);
        end
    else
        step(i) = step(i-1);
    end
end

% Display encoded bits
disp('Sample  Input Value  ADM Bit  Step Size  Reconstructed Value')
for i = 1:length(xs)
    fprintf('%2d\t %8.2f\t %d\t\t %6.2f\t\t %8.2f\n', ...
        i, xs(i), bits(i), step(i), dm(i));
end

% Plot
figure
subplot(4,1,1); plot(t,x,'LineWidth',1.5); title('Original Signal'); grid on
subplot(4,1,2); stem(ts,xs,'filled'); title('Sampled Signal'); grid on
subplot(4,1,3); stairs(ts,bits,'LineWidth',1.5); ylim([-0.2 1.2])
title('Adaptive Delta Modulation Bit Sequence'); grid on
subplot(4,1,4); stairs(ts,dm,'r','LineWidth',1.5); hold on
stem(ts,xs,'filled'); title('ADM Reconstructed Signal'); grid on

% Note: The corresponding Simulink model implements the adaptive step-size
% logic using Relational Operator, Switch, Product and Unit Delay blocks
% in a feedback configuration.
