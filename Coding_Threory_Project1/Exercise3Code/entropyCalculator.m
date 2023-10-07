function H = entropyCalculator(pinf)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
H = 0;

for i = 1:length(pinf)
    if pinf(i) ~= 0

        H = H - pinf(i)*log2(pinf(i));

    end

end

end