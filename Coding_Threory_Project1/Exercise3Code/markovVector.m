function x = markovVector(N)

temp = 1;
x = [1];
for i = 1:N
    if temp == 1
        temp = markov1;
        x = [x temp];
    elseif temp == 2
        temp = markov2;
        x = [x temp];
    elseif temp == 3
        temp = markov3;
        x = [x temp];
    elseif temp == 4
        temp = markov4;
        x = [x temp];
    else
        temp = markov5;
        x = [x temp];
    end

end