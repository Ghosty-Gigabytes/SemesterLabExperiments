% Objective: To perform the conversion of an analog signal into a digital signal (sampling, quantization and encoding) using MATLAB.

% Continuous signal
A = 5; f = 2;
t = 0:0.001:2;
x = A*sin(2*pi*f*t);

% Sampling
Fs = 20;
ts = 0:1/Fs:2;
xs = A*sin(2*pi*f*ts);

% Quantization
L = 8; % 8 levels
xmin = -A; xmax = A;
delta = (xmax-xmin)/(L-1);
index = round((xs-xmin)/delta);
index(index<0) = 0;
index(index>L-1) = L-1;
xq = xmin + index*delta;

% Encoding
bits = ceil(log2(L));
disp('Sample  Quantized Value  Binary Code')
for i = 1:length(index)
    code = dec2bin(index(i), bits);
    fprintf('%2d\t %8.2f\t\t%s\n', i, xq(i), code);
end

% Plot
figure
subplot(3,1,1); plot(t,x,'LineWidth',1.5); title('Original Signal'); grid on
subplot(3,1,2); stem(ts,xs,'filled'); title('Sampled Signal'); grid on
subplot(3,1,3); stairs(ts,xq,'r','LineWidth',2); hold on
stem(ts,xq,'filled'); title('Quantized Signal'); grid on
