close all
clear all
clc

%   Huffman Code
%   =============
%   1 ---> 0
%   2 ---> 10
%   3 ---> 110
%   4 ---> 111
%

%%1.1
p = [1/2 1/4 1/8 1/8];
H = 0;
for i = 1:4
    H = H - p(i)*log2(p(i));
end
H;

%%1.2
x = randomVector();
%%1.3-1.4
encodedWords = [];
decodedWords = [];
totalEncodedLength = 0;
totalDecodedLength = 0;
for i = 1:1000
    temp = randomVector();
    encodedWord = huffmanEncoder(temp);
    totalEncodedLength = totalEncodedLength + length(encodedWord);
    numArrayWords = encodedWord - '0';
    encodedWords = [encodedWords numArrayWords 2];
    decodedWord = huffmanDecoder(encodedWord);
    totalDecodedLength = totalDecodedLength + length(decodedWord);
    numArray = decodedWord - '0';
    decodedWords = [decodedWords numArray 2];
    if numArray ~= temp
        disp("There was an error!");
    end
    
end


EntropyEstimate = totalEncodedLength / totalDecodedLength; %1,7563 pretty close to the real Entropy.
EntropyError = (EntropyEstimate-H)*100; %0.6260 % error.

%%1.5
counter = 0;
D5Distr = [];
D6Distr = [];
D56Distr = [];
for i = 1:length(encodedWords)
    if encodedWords(i) == 2
        counter = 0;
    end
    counter = counter + 1;
    if counter == 5
        D5Distr = [D5Distr encodedWords(i)];
        D56Distr = [D56Distr encodedWords(i) encodedWords(i+1)];
    elseif counter == 6
        D6Distr = [D6Distr encodedWords(i)];
    end
end
p51 = sum(D5Distr)/length(D5Distr);
p50 = 1 - p51;

p61 = sum(D6Distr)/length(D6Distr);
p60 = 1 - p61;

count = 0;
temp = [];
p56_00 = 0;
p56_01 = 0;
p56_10 = 0;
p56_11 = 0;
for i=1:length(D56Distr)
    
    temp = [temp D56Distr(i)];
    count = count + 1;
    if count == 2
        
        count = 0;
        if temp == [0 0]
            p56_00 = p56_00 + 1;
        elseif temp == [1 0]
            p56_10 = p56_10 + 1;
        elseif temp == [0 1]
            p56_01 = p56_01 + 1;
        else 
            p56_11 = p56_11 + 1;
        end
        temp = [];
    end
    

end

p56_00 = 2*(p56_00/length(D56Distr))
p56_01 = 2*(p56_01/length(D56Distr))
p56_10 = 2*(p56_10/length(D56Distr))
p56_11 = 2*(p56_11/length(D56Distr))






