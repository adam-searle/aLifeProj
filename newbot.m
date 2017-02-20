function [ genotype ] = newbot()
%bot
a = 2; b = 11;  
Ga = 1; Gb = 7;
Agenes = (round((Gb-Ga)*rand(1,128)+Ga)); %action genes
Pgenes = round(rand(1,21))+1;%perception genes
genotype = [Agenes, Pgenes];

end













