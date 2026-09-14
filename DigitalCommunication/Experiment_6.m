% Objective: To simulate and implement Differential Pulse Code Modulation (DPCM) using MATLAB and Simulink.

clc; clear; close all;

% Continuous signal
A = 5; f = 2;
t = 0:0.001:2;
x = A*sin(2*pi*f*t);

% Sampling
Fs = 20;
ts = 0:1/Fs:2;
xs = A*sin(2*pi*f*ts);

% DPCM Prediction
pred = [0 xs(1:end-1)];

% Difference signal
d = xs - pred;

% Quantization of difference
L = 8; % 8 levels
dmin = min(d); dmax = max(d);
delta = (dmax-dmin)/(L-1);
index = round((d-dmin)/delta);
index(index<0) = 0;
index(index>L-1) = L-1;
dq = dmin + index*delta;

% Encoding
bits = ceil(log2(L));
disp('Sample  Difference  Quantized Difference  Binary Code')
for i = 1:length(index)
    code = dec2bin(index(i), bits);
    fprintf('%2d\t %8.2f\t\t %8.2f\t\t%s\n', i, d(i), dq(i), code);
end

% Reconstruction
xr = zeros(size(xs));
for i = 1:length(xs)
    if i == 1
        xr(i) = dq(i);
    else
        xr(i) = xr(i-1) + dq(i);
    end
end

% Plot
figure
subplot(4,1,1); plot(t,x,'LineWidth',1.5); title('Original Signal'); grid on
subplot(4,1,2); stem(ts,xs,'filled'); title('Sampled Signal'); grid on
subplot(4,1,3); stem(ts,dq,'filled'); title('DPCM Difference Signal'); grid on
subplot(4,1,4); stairs(ts,xr,'r','LineWidth',1.5); hold on
stem(ts,xr,'filled'); title('Reconstructed Signal'); grid on

% Note: The corresponding Simulink model uses a Unit Delay block to generate
% the predicted sample, a Sum block to compute the prediction error, and
% Quantizer, Bias and Gain blocks to encode the difference signal.
