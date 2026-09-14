% Objective: To implement the Huffman coding algorithm for lossless data compression using MATLAB.

clc; clear;
symbols = {'A','B','C','D','E'};
prob = [0.40 0.25 0.15 0.10 0.10];
codes = {'','','','',''};
nodes = symbols;
p = prob;

while length(p) > 1
    [p,idx] = sort(p);
    nodes = nodes(idx);
    for i = 1:5
        if contains(nodes{1},symbols{i})
            codes{i} = ['0' codes{i}];
        elseif contains(nodes{2},symbols{i})
            codes{i} = ['1' codes{i}];
        end
    end
    nodes{1} = [nodes{1} nodes{2}];
    p(1) = p(1) + p(2);
    nodes(2) = [];
    p(2) = [];
end

fprintf('Symbol\tProbability\tCode\n');
for i = 1:5
    fprintf('%s\t%.2f\t\t%s\n',symbols{i},prob(i),codes{i});
end

H = -sum(prob .* log2(prob));
Lavg = sum(prob .* cellfun(@length,codes));
eff = H/Lavg * 100;
fprintf('\nEntropy = %.4f bits/symbol\n',H);
fprintf('Average Code Length = %.4f bits/symbol\n',Lavg);
fprintf('Efficiency = %.2f%%\n',eff);
