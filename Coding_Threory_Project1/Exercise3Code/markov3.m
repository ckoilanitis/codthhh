function x = markov3()

temp = randi(64,1);

if temp <= 16
    x = 1;
elseif temp >16 && temp <= 24
    x = 2;
elseif temp > 24 && temp <= 32
    x = 3;
elseif temp > 32 && temp <= 48
    x = 4;
else
    x = 5;
end
end