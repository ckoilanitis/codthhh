function plot_probabilities = probabilitiesToBePloted(n,probabilities)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
for i = 1:n
    if i == 1
        plot_probabilities(i) = probabilities(i);
    end
        plot_probabilities(2*i) = probabilities(i+1);
        plot_probabilities(2*i+1) = probabilities(i+1);
end
end