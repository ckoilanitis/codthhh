function propability = probabilityForTypSeq(n,H,e,p)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
lowBound = 2^(-n*(H+e));
highBound = 2^(-n*(H-e));
probabilities = zeros(n+1);
k = 1;
for i = 0:n

    probabilities(i + 1) = p^(i)*(1-p)^(n-i);

    if(probabilities(i + 1) <= highBound && probabilities(i + 1) >= lowBound)
        ind(k) = i;
        k = k + 1;
    end
end
num = 0;
for i = 1:k-1
    num = num + (probabilities(ind(i)+1)*nchoosek(n,ind(i)));
end

propability = (num);
end