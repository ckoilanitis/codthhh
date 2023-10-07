function bitsVsN(H,e,p,figurenum)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
n = 10:10:1000;
probabilities = ones(1,100);
total = ones(1,100);
for i = 1:100
    probabilities(i) = probabilityForTypSeq(n(i),H,e,p);
    total(i) = totalTypicalSeq(n(i),H,e,p);
end

num = ones(1,100);
lowbound = ones(1,100);
highbound = ones(1,100);
for i = 1:100
    num(i) = ((probabilities(i)*(ceil(total(i))+1)) + (1-probabilities(i))*(n(i)+1))/n(i);
    lowbound(i) = (H - e);
    highbound(i) = (H + e);

end

figure(figurenum)
plot(n,num);
hold on;
plot(n,lowbound,'r');
hold on;
plot(n,highbound,'r');
grid on;
hold off;
end