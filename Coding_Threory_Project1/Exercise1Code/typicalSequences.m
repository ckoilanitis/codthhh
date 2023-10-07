function typicalSequences(p,H,e,figurenum)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
n = 10:10:1000;
lowBoundForTypSeq = @(n,H,e) (1-e)*(2^(n*(H-e)));
upperBoundForTypSeq = @(n,H,e) (2^(n*(H+e)));
for i = 1:100
    numOfTypicalSeq(i) = totalTypicalSeq(n(i),H,e,p);
    lowBound(i) = log(lowBoundForTypSeq(n(i),H,e));
    upperBound(i) = log(upperBoundForTypSeq(n(i),H,e));
end
figure(figurenum)
plot(n,numOfTypicalSeq)
hold on;
plot(n,lowBound,'r');
hold on;
plot(n,upperBound, 'r');
grid on;
hold off;

end