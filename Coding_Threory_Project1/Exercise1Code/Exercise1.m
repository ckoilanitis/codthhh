clc
clear all 
close all
%%1.1-1.4
H1 = 0.9928;
H2 = 0.4690;
e = 0.05;
lowBound = @(n,H,e) 2^(-n*(H+e));
highBound = @(n,H,e) 2^(-n*(H-e));
n1 = 15;
n2 = n1;
n3 = 50;
n4 = n3;
p1 = 0.45; 
q1 = 1 - p1; 
p2 = 0.1;
q2 = 1 - p2;
p3 = p1;
q3 = 1 - p3;
p4 = p2;
q4 = 1 - p2;


number_of_printing_seq_1 = 2*n1-1;
number_of_printing_seq_2 = 2*n2-1;
number_of_printing_seq_3 = 2*n3-1;
number_of_printing_seq_4 = 2*n4-1;

probabilites_dep_on_ones_p1 = probabilitiesCalculator(n1,p1,q1);
indexes_1 = indexesCalculator(n1,number_of_printing_seq_1);
probabilities_plot_1 = probabilitiesToBePloted(n1,probabilites_dep_on_ones_p1);
lowB_1 = ones(1,length(indexes_1))*log(lowBound(n1,H1,e));
highB_1 = ones(1,length(indexes_1))*log(highBound(n1,H1,e));

probabilites_dep_on_ones_p2 = probabilitiesCalculator(n2,p2,q2);
indexes_2 = indexesCalculator(n2,number_of_printing_seq_2);
probabilities_plot_2 = probabilitiesToBePloted(n2,probabilites_dep_on_ones_p2);
lowB_2 = ones(1,length(indexes_2))*log(lowBound(n2,H2,e));
highB_2 = ones(1,length(indexes_2))*log(highBound(n2,H2,e));


probabilites_dep_on_ones_p3 = probabilitiesCalculator(n3,p3,q3);
indexes_3 = indexesCalculator(n3,number_of_printing_seq_3);
probabilities_plot_3 = probabilitiesToBePloted(n3,probabilites_dep_on_ones_p3);
lowB_3 = ones(1,length(indexes_3))*log(lowBound(n3,H1,e));
highB_3 = ones(1,length(indexes_3))*log(highBound(n3,H1,e));


probabilites_dep_on_ones_p4 = probabilitiesCalculator(n4,p4,q4);
indexes_4 = indexesCalculator(n4,number_of_printing_seq_4);
probabilities_plot_4 = probabilitiesToBePloted(n4,probabilites_dep_on_ones_p4);
lowB_4 = ones(1,length(indexes_4))*log(lowBound(n4,H2,e));
highB_4 = ones(1,length(indexes_4))*log(highBound(n4,H2,e));


figure(1)
plot(indexes_1,probabilities_plot_1(1:end-2))
hold on;
plot(indexes_1,lowB_1,'r')
hold on;
plot(indexes_1,highB_1,'r');
grid on;
hold off;
axis([-0.25*10^4 3.5*10^4 -12 -8.5])
figure(2)
plot(indexes_2,probabilities_plot_2(1:end-2))
hold on;
plot(indexes_2,lowB_2,'r')
hold on;
plot(indexes_2,highB_2,'r')
hold off;
axis([-0.25*10^4 3.7*10^4 -32.7 -1])
grid on;
figure(3)
plot(indexes_3,probabilities_plot_3(1:end-2))
hold on;
plot(indexes_3,lowB_3,'r')
hold on;
plot(indexes_3,highB_3,'r')
hold off;
axis([-1*10^14 12*10^14 -40 -29])
grid on;
figure(4)
plot(indexes_4,probabilities_plot_4(1:end-2))
hold on;
plot(indexes_4,lowB_4,'r')
hold on;
plot(indexes_4,highB_4,'r')
hold off;
axis([-1*10^14 12*10^14 -114 -2])
grid on;

%%1.5
typicalSequences(p1,H1,e,5);
typicalSequences(p2,H2,e,6);

%%1.6
probabilitiesTypicalSequences(p1,H1,e,7);
probabilitiesTypicalSequences(p2,H2,e,8);

%%1.7
bitsVsN(H1,e,p1,9);
bitsVsN(H2,e,p2,10);






