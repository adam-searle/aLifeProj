function [ mutant ] = botmutate( genotype )
%mutant Takes an individual and mutates


mutationRateA = 1/149; %128; %Arate
mutationRateP = 1/149; %121; %Prate
mutantA = genotype(1:128);
mutantP = genotype(129:end);

    for i = 1 : 128 %mutate Agenes
        if(rand <= mutationRateA)
            m = randi(7,1);
            mutantA(i) = m;
        end
    end
    
    for i = 1 : 21 %mutate Pgenes
        if(rand <= mutationRateP)
           m = randi(2,1);
           mutantP(i) = m;
        end

mutant = [mutantA, mutantP];
end

