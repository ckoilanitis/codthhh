close all 
clear all 
clc
data = [];
%%
for i = 1 : 10040
    temp = rand();

    if temp <= 0.1
        data = [data 1];
    else
        data = [data 0];
    end
end
%%
p1 = sum(data)/length(data);
p0 = 1 - p1;
data_propabilities = [p0 p1];
H = entropyCalculator(data_propabilities);
%%
out = arithmetic_coder_final(data,p1);
h_est = length(out)/length(data);
%%
after = arithmetic_decoder(out,p1);
data = data(1:10000);
after = after(1:10000);


