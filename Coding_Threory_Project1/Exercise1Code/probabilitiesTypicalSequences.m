function probabilitiesTypicalSequences(p,H,e,figureNum)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
n = 10:10:1000;
for i = 1:100
    probOfTypicalSeq(i) = probabilityForTypSeq(n(i),H,e,p);
    lowBound(i) = 1-e;
end

figure(figureNum)
plot(n,probOfTypicalSeq)
hold on;
plot(n,lowBound,'r')
grid on;

hold off;
end