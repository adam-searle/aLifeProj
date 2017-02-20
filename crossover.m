function [ offspring ] = crossover(genotypeA, genotypeB)
%gene for gene, randomly selected, crossover 

crossoverRate = 1/2; 

for i = 1 : 149 
    if  rand < crossoverRate
        offspring(i) = genotypeA(i);
    else
        offspring(i) = genotypeB(i);
    end
end

end

