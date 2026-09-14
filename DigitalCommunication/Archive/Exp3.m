% Experiment 3: Implement Hoffman encoding in matlab for data compression
clc;
clear;
close all;
data = 'The quick brown fox jumps over the lazy dog';
fprintf('Original Data:\n%s\n\n', data);

symbols = unique(data);
freq = zeros(1, length(symbols));

for i = 1:length(symbols)
    freq(i) = sum(data == symbols(i));
end

fprintf('Character Frequencies:\n');

for i = 1:length(symbols)

    if symbols(i) == ' '
        fprintf('Space : %d\n', freq(i));
    else
        fprintf('%c     : %d\n', symbols(i), freq(i));
    end

end

nodes = cell(1, length(symbols));

for i = 1:length(symbols)

    nodes{i} = struct( ...
        'symbol', symbols(i), ...
        'freq', freq(i), ...
        'left', [], ...
        'right', []);

end
while length(nodes) > 1


    frequencies = cellfun(@(x) x.freq, nodes);


    [~, order] = sort(frequencies);

    nodes = nodes(order);

    leftNode = nodes{1};
    rightNode = nodes{2};

    parentNode = struct( ...
        'symbol', '', ...
        'freq', leftNode.freq + rightNode.freq, ...
        'left', leftNode, ...
        'right', rightNode);
    nodes(1:2) = [];
    nodes{end+1} = parentNode;

end

root = nodes{1};
codes = cell(1, length(symbols));
stack = cell(1, 1);
stack{1} = {root, ''};

while ~isempty(stack)
    current = stack{end};
    stack(end) = [];

    node = current{1};
    code = current{2};
    if isempty(node.left) && isempty(node.right)

        index = find(symbols == node.symbol);
        codes{index} = code;

    else
        if ~isempty(node.left)
            stack{end+1} = {node.left, [code '0']};
        end
        if ~isempty(node.right)
            stack{end+1} = {node.right, [code '1']};
        end

    end

end
fprintf('\nHuffman Codes:\n');

for i = 1:length(symbols)

    if symbols(i) == ' '
        fprintf('Space : %s\n', codes{i});
    else
        fprintf('%c     : %s\n', symbols(i), codes{i});
    end

end


prob = freq / length(data);
codeLength = zeros(1, length(symbols));

for i = 1:length(symbols)
    codeLength(i) = length(codes{i});
end
entropy = -sum(prob .* log2(prob));
averageCodeLength = sum(prob .* codeLength);
efficiency = (entropy / averageCodeLength) * 100;
redundancy = averageCodeLength - entropy;

fprintf('\nCode Length and Probability:\n');

fprintf('%-10s %-12s %-12s %-12s\n', ...
    'Symbol', 'Probability', 'Code', 'Length');

fprintf('----------------------------------------------\n');

for i = 1:length(symbols)

    if symbols(i) == ' '
        fprintf('%-10s %-12.4f %-12s %-12d\n', ...
            'Space', prob(i), codes{i}, codeLength(i));
    else
        fprintf('%-10s %-12.4f %-12s %-12d\n', ...
            symbols(i), prob(i), codes{i}, codeLength(i));
    end

end

fprintf('\nInformation Theory Results:\n');

fprintf('Entropy             : %.4f bits/symbol\n', entropy);
fprintf('Average Code Length : %.4f bits/symbol\n', averageCodeLength);
fprintf('Coding Efficiency   : %.2f%%\n', efficiency);
fprintf('Redundancy          : %.4f bits/symbol\n', redundancy);
encodedData = '';

for i = 1:length(data)

    index = find(symbols == data(i));

    encodedData = [encodedData codes{index}];

end

fprintf('\nEncoded Data:\n%s\n', encodedData);
decodedData = '';
currentNode = root;

for i = 1:length(encodedData)

    if encodedData(i) == '0'
        currentNode = currentNode.left;
    else
        currentNode = currentNode.right;
    end
    if isempty(currentNode.left) && isempty(currentNode.right)

        decodedData = [decodedData currentNode.symbol];

        currentNode = root;

    end

end

fprintf('\nDecoded Data:\n%s\n', decodedData);
originalBits = length(data) * 8;
compressedBits = length(encodedData);
compressionPercentage = ...
    (1 - compressedBits / originalBits) * 100;
fprintf('\nCompression Results:\n');
fprintf('Original size    : %d bits\n', originalBits);
fprintf('Compressed size  : %d bits\n', compressedBits);
fprintf('Space saved      : %.2f%%\n', compressionPercentage);
