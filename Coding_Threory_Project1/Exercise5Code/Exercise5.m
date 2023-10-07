%%
%Exercise 5
%%
clear all
clc 
%%
P = [0.05 0.55;
     0.95 0.45];
[Q, L] = eig(P);
pinf = Q(:,2);
pinf = pinf/sum(pinf);

H = entropyCalculator(pinf);

H1 = entropyCalculator(P(:,1));
H2 = entropyCalculator(P(:,2));

H_matrix = [H1 H2];
H_rate = H_matrix*pinf; % 0.7338
H; % 0.9481
x = markovVector(10000);
%%
p1 = 0.95;
p2 = 0.45;
out = arithmetic_coder_final(x,p1,p2);