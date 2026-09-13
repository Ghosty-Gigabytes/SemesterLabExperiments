% Experiment 4: Implement Shannon Fano encoding in matlab for data compression
clc;
clear;
close all;


function codes = shannonFano(p, first, last, code, codes)

    if first == last
        codes{first} = code;
        return;
    end

    total = sum(p(first:last));
    s = 0;
    best = first;
    diff = Inf;

    for i = first:last-1
        s = s + p(i);
        d = abs(s - (total-s));

        if d < diff
            diff = d;
            best = i;
        end
    end

    codes = shannonFano(p, first, best, [code '0'], codes);
    codes = shannonFano(p, best+1, last, [code '1'], codes);
end

data = 'The quick brown fox jumps over the lazy dog';

symbols = unique(data);
freq = zeros(size(symbols));

for i = 1:length(symbols)
    freq(i) = sum(data == symbols(i));
end

prob = freq / length(data);

[prob, order] = sort(prob, 'descend');
symbols = symbols(order);
freq = freq(order);

codes = cell(size(symbols));
codes = shannonFano(prob, 1, length(prob), '', codes);

fprintf('Symbol\tFrequency\tProbability\tCode\tLength\n');

for i = 1:length(symbols)
    if symbols(i) == ' '
        fprintf('Space\t%d\t\t%.4f\t\t%s\t%d\n', ...
            freq(i), prob(i), codes{i}, length(codes{i}));
    else
        fprintf('%c\t%d\t\t%.4f\t\t%s\t%d\n', ...
            symbols(i), freq(i), prob(i), codes{i}, length(codes{i}));
    end
end

encoded = '';
for i = 1:length(data)
    encoded = [encoded codes{find(symbols == data(i))}];
end


decoded = '';
temp = '';

for i = 1:length(encoded)
    temp = [temp encoded(i)];
    k = find(strcmp(codes, temp), 1);

    if ~isempty(k)
        decoded = [decoded symbols(k)];
        temp = '';
    end
end

L = sum(prob .* cellfun(@length, codes));
H = -sum(prob .* log2(prob));
efficiency = H / L * 100;

fprintf('\nEncoded Data:\n%s\n', encoded);
fprintf('\nDecoded Data:\n%s\n', decoded);

fprintf('\nEntropy             : %.4f bits/symbol\n', H);
fprintf('Average Code Length : %.4f bits/symbol\n', L);
fprintf('Efficiency          : %.2f%%\n', efficiency);
fprintf('Original Size       : %d bits\n', length(data)*8);
fprintf('Compressed Size     : %d bits\n', length(encoded));
fprintf('Space Saved         : %.2f%%\n', ...
    (1-length(encoded)/(length(data)*8))*100);


