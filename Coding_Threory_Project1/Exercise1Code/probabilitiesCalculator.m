function probabilities = probabilitiesCalculator(n,p,q)
%   Summary of this function goes here
%   Detailed explanation goes here

f =@(k) ((p)^k)*(q^(n-k));

%Calculating probabilties for a sequence depending on 
%how many ones it has.
for i = 0:n
    probabilities(i+1) = log(f(i));
end

end
