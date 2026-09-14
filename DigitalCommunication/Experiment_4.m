% Objective: To implement the Shannon-Fano encoding algorithm for lossless data compression using MATLAB.

function codes = shannonFano(symbols, prob)
    [prob, idx] = sort(prob, 'descend');
    symbols = symbols(idx);
    codes = repmat({''}, 1, length(symbols));
    codes = sf(symbols, prob, codes, 1:length(symbols));
end

function codes = sf(symbols, prob, codes, ind)
    if length(ind) <= 1
        return;
    end
    total = sum(prob(ind));
    s = 0; split = 1;
    for i = 1:length(ind)-1
        s = s + prob(ind(i));
        if abs(total/2 - s) < abs(total/2 - (s-prob(ind(i))))
            split = i;
        end
    end
    codes(ind(1:split)) = cellfun(@(x)['0' x], ...
        codes(ind(1:split)), 'UniformOutput', false);
    codes(ind(split+1:end)) = cellfun(@(x)['1' x], ...
        codes(ind(split+1:end)), 'UniformOutput', false);
    codes = sf(symbols, prob, codes, ind(1:split));
    codes = sf(symbols, prob, codes, ind(split+1:end));
end

% Example
symbols = {'A','B','C','D'};
prob = [0.4 0.3 0.2 0.1];
codes = shannonFano(symbols, prob);

fprintf('Shannon-Fano Codes:\n');
fprintf('Symbol\tProbability\tCode\n');
for i = 1:length(symbols)
    fprintf('%s\t%.2f\t\t%s\n', symbols{i}, prob(i), codes{i});
end

H = -sum(prob .* log2(prob));
Lavg = sum(prob .* cellfun(@length,codes));
eff = (H/Lavg)*100;
fprintf('\nEntropy = %.4f bits/symbol\n', H);
fprintf('Average Code Length = %.4f bits/symbol\n', Lavg);
fprintf('Efficiency = %.2f%%\n', eff);
