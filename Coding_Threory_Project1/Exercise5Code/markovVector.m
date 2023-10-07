function x = markovVector(N)

temp = 1;
x = [1];
for i = 1:N
    if temp == 0
        temp = markov0;
        x = [x temp];
    else
        temp = markov1;
        x = [x temp];
    end

end