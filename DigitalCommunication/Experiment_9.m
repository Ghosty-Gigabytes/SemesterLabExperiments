clc;
clear;
close all;
N = 100;                 
sps = 100;               
T = 1;                   
rng(1);                 
bits = randi([0 1], 1, N);
symbols = 2*bits - 1;   
x = zeros(1, N*sps);
x(1:sps:end) = symbols;
%% PART A: RECTANGULAR PULSE SHAPING
t_rect = -T/2 : T/sps : T/2;
p_rect = ones(size(t_rect));
plotPart(x, symbols, p_rect, sps, T, ...
         'Part A: Rectangular Pulse Shaping');
%% PART B: HALF-SINE PULSE SHAPING
t_half = -T/2 : T/sps : T/2;
p_half = cos(pi*t_half/T);
plotPart(x, symbols, p_half, sps, T, ...
         'Part B: Half-Sine Pulse Shaping');
%% PART C: GAUSSIAN PULSE SHAPING
span = 2;                
sigma = 0.35*T;          
t_gauss = -span*T : T/sps : span*T;
p_gauss = exp(-(t_gauss.^2)/(2*sigma^2));
plotPart(x, symbols, p_gauss, sps, T, ...
         'Part C: Gaussian Pulse Shaping');

function plotPart(x, symbols, pulse, sps, T, partName)
    pulse = pulse / max(abs(pulse));
    y = conv(x, pulse, 'full');
    center = (length(pulse)+1)/2;
    sampleIndices = round(center + ...
        (0:length(symbols)-1)*sps);
    received = y(sampleIndices);
    received = received / max(abs(pulse));
    isiMetric = sqrt(mean((received - symbols).^2));
    time = (0:length(y)-1)/sps;
    figure('Name', partName);
    subplot(2,1,1);
    plot(time, y, 'LineWidth', 1.2);
    grid on;
    xlabel('Time (in symbol durations)');
    ylabel('Amplitude');
    title([partName ' - PAM Waveform']);
    xlim([0 min(20, length(y)/sps)]);
    subplot(2,1,2);
    hold on;
    for k = 2:length(symbols)-1
        idx = sampleIndices(k);
        startIdx = idx - sps;
        endIdx = idx + sps;
        if startIdx >= 1 && endIdx <= length(y)
            segment = y(startIdx:endIdx);
            eyeTime = (-sps:sps)/sps * T;
            plot(eyeTime, segment);
        end
    end
    grid on;
    xlabel('Time relative to symbol center');
    ylabel('Amplitude');
    title('Eye Diagram');
    xlim([-T T]);
    hold off;
    fprintf('\n%s\n', partName);
    fprintf('ISI metric (RMS sampling error) = %.6f\n', ...
            isiMetric);
end
