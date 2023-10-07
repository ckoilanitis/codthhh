function x = markov4()

temp = randi(64,1);

if temp <= 8
    x = 1;
elseif temp > 8 && temp <= 40
    x = 3;
elseif temp > 40 && temp <= 56
    x = 4;
else
    x = 5;
end
end