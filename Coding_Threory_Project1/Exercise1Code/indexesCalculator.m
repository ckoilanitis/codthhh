function indexes = indexesCalculator(n,number_of_printing_seq)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    counter = 0;
    for i = 1:number_of_printing_seq
        
        if i == 1 
            indexes(i) = 1;
        elseif i == 2
            indexes(i) = 2;
        elseif mod(i,2) == 1
            counter = counter + 1;
            indexes(i) = indexes(i-1) + nchoosek(n,counter);
        elseif mod(i,2) == 0
            indexes(i) = indexes(i-1) + 1;
        end
    
    end
end