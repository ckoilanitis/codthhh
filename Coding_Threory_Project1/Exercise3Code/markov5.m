function x = markov5()

temp = randi(64,1);

if temp <= 32
    x = 2;
elseif temp >32 && temp <= 48
    x = 3;
else 
    x = 4;

end

end