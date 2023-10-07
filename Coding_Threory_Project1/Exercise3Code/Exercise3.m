close all
clear all
clc

P = [1/2 1/4 1/4 1/8 0;
     1/8 1/8 1/8 0 1/2;
     1/8 1/16 1/8 1/2 1/4;
     1/8 1/16 1/4 1/4 1/4;
     1/8 1/2 1/4 1/8 0];
[Q, L] = eig(P);
pinf = Q(:,1);
pinf = pinf/sum(pinf); % 0.238000306701426 0.173593007207484 0.208556969789910 0.187701272810919 0.192148443490262

H = entropyCalculator(pinf);

H1 = entropyCalculator(P(:,1));
H2 = entropyCalculator(P(:,2));
H3 = entropyCalculator(P(:,3));
H4 = entropyCalculator(P(:,4));
H5 = entropyCalculator(P(:,5));

H_matrix = [H1 H2 H3 H4 H5];
H_rate = H_matrix*pinf; % 1.8874
H; % 2.3133

%Coding and measuring H without memory.
x = markovVector(100);
allcoded =[];
lengthWord = 0;
lengthCodedWord = 0;
for i = 1:1000
    
    word = markovVector(100);
    codedWord = huffmanEncoderPinf(word);
    allcoded = [allcoded codedWord];
    length(codedWord);
    lengthCodedWord = lengthCodedWord + length(codedWord);
    lengthWord = lengthWord + length(word);
    

end

H_estimate = lengthCodedWord /lengthWord; %2.3558 close to H 

%Coding and measuring H_rate with memory.
codedWordsLength = 0;
wordsLength = 0;
for i = 1:1000
    codedWord = [];
    word = markovVector(100);
    temp = word(1);
    codedWord = [huffmanEncoder2(temp) codedWord];

    for j = 2 : length(word)
        if temp == 1
            codedWord = [codedWord huffmanEncoder1(word(j))];
            temp = word(j);
        elseif temp == 2
            codedWord = [codedWord huffmanEncoder2(word(j))];
            temp = word(j);
        elseif temp == 3 
            codedWord = [codedWord huffmanEncoder3(word(j))];
            temp = word(j);
        elseif temp == 4
            codedWord = [codedWord huffmanEncoder4(word(j))];
            temp = word(j);
        else 
            codedWord = [codedWord huffmanEncoder5(word(j))];
            temp = word(j);
        end



    end
    codedWordsLength = codedWordsLength + length(codedWord);
    wordsLength = wordsLength + length(word);
    
    

end

H_rate_estimate = codedWordsLength / wordsLength; %1.8876 close to H_rate

