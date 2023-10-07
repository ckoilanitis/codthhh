function x = randomVector()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
x = ones(1,100);
for i = 1:100
    
        
    temp = randi(64,1);
    if(temp <= 32)
        if(i == 1)
            x(i) = 2;
        else
            x(i) = 1;
        end
    elseif (temp>32 && temp <=48)
        x(i) = 2;
    elseif (temp > 48 && temp<=56)
        x(i) = 3;
    elseif (temp > 56)
        x(i) = 4;
    end
   
end
end