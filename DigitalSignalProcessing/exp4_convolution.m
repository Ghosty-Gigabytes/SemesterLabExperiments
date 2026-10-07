clc; clear; close all;
x = input('Enter the sequence x(n) = ');
h = input('Enter the sequence h(n) = ');
N = input('Enter the length N of the circular convolution = ');
L = length(x) + length(h) - 1;

yl = conv(x, h);
yc = cconv(x, h, N);
yf = cconv(x, h, L);
fprintf('\n%-34s = [ %s]\n', 'Linear convolution', sprintf('%g ', yl));
fprintf('%-34s = [ %s]\n', sprintf('Circular convolution, N = %d', N), sprintf('%g ', yc));
fprintf('%-34s = [ %s]\n', sprintf('Circular convolution, N = %d', L), sprintf('%g ', yf));

S = {x, h, yl, yc};
s = {'Sequence x(n)', 'Sequence h(n)', 'Linear convolution', sprintf('Circular convolution, N = %d', N)};
for i = 1:4
    subplot(2,2,i); stem(0:length(S{i})-1, S{i}, 'filled'); title(s{i});
    xlabel('n'); set(gca, 'XTick', 0:length(S{i})-1); grid on;
end
