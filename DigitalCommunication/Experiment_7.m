% Objective: To simulate and implement Delta Modulation (DM) using MATLAB and Simulink.

clc; clear; close all;

% Continuous signal
A = 5; f = 2;
t = 0:0.001:2;
x = A*sin(2*pi*f*t);

% Sampling
Fs = 20;
ts = 0:1/Fs:2;
xs = A*sin(2*pi*f*ts);

% Delta Modulation
delta = 1.5; % Step size
dm = zeros(size(xs));
bits = zeros(size(xs));
dm(1) = 0;

for i = 2:length(xs)
    if xs(i) >= dm(i-1)
        bits(i) = 1;
        dm(i) = dm(i-1) + delta;
    else
        bits(i) = 0;
        dm(i) = dm(i-1) - delta;
    end
end

% Display encoded bits
disp('Sample  Input Value  DM Bit  Reconstructed Value')
for i = 1:length(xs)
    fprintf('%2d\t %8.2f\t %d\t\t %8.2f\n', i, xs(i), bits(i), dm(i));
end

% Plot
figure
subplot(4,1,1); plot(t,x,'LineWidth',1.5); title('Original Signal'); grid on
subplot(4,1,2); stem(ts,xs,'filled'); title('Sampled Signal'); grid on
subplot(4,1,3); stairs(ts,bits,'LineWidth',1.5); ylim([-0.2 1.2])
title('Delta Modulation Bit Sequence'); grid on
subplot(4,1,4); stairs(ts,dm,'r','LineWidth',1.5); hold on
stem(ts,xs,'filled'); title('Delta Modulation Reconstructed Signal'); grid on

% Note: The corresponding Simulink model implements the same Delta
% Modulation scheme using Sign, Gain, Sum and Unit Delay blocks in a
% feedback configuration.
