function x = markov1()

temp = randi(64,1);

if temp <= 32
    x = 1;
elseif temp >32 && temp <= 40
    x = 2;
elseif temp > 40 && temp <= 48
    x = 3;
elseif temp > 48 && temp <= 56
    x = 4;
else
    x = 5;
end

end