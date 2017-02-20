figure;
nsteps = 200; %number of steps
nbots = 2; %number of bots
ngenerations = 1000;
nr = 10; %number of each resource
popsize = 100; %size of population, if nbots > 1, genotypes are considered together, e.g if nbots = 2, an individual in the population would be a pair.
pop1 = zeros(popsize,149,nbots);  %Generates population of empty genotypes
pop2 = zeros(popsize,149,nbots); %Generates population of empty genotypes
% pop1 = pop1clone;
% pop2 = pop2clone;

bestP1 = 0; % initial fitness plot, which will be added to array for population 1
bestP2 = 0; % initial fitness plot, which will be added to array for population 2
bestP1i = []; % array fittnes plot for population 1
bestP2i = []; % array fitness plot for population 2

for i = 1 : popsize %Fill the populations
    for j = 1 : nbots
    pop1(i,:,j) = newbot;
    pop2(i,:,j) = newbot;
    end
end 
    
for i = 1 : ngenerations %Run evolution          
      
    for j = 1 : popsize %Cycle through pop1
        bestP1i = [bestP1i,  bestP1]; 
   
        %Circular selection within 3 spaces.       
        r = randi([-3, 3]); 
        if (j + r) > popsize 
            shift = (j+r) - popsize;
        elseif (j + r) <1
            shift = (j+r) + popsize;
        else
            shift = j + r;
        end
                       
        ind1 = pop1(j,:,:);
        ind2 = pop2(shift,:,:);
        fit1 = run(nbots, nsteps, ind1, nr);
        fit2 = run(nbots, nsteps, ind2, nr);
        
        if fit1 > fit2
            for k = 1 : nbots
                pop2(shift,:,k) = botmutate(crossover(ind1(:,:,k),ind2(:,:,k)));
            end
            if fit1 > bestP1
                bestP1 = fit1;               
            end               
           
        elseif fit1 < fit2
            for k = 1: nbots
                pop1(j,:,k) = botmutate(crossover(ind1(:,:,k),ind2(:,:,k)));
            end

        end  
                
    
    end
    
    
    for j = 1 : popsize %Cycle through pop2
        bestP2i = [bestP2i, bestP2]; 
        %Circular selection within 3 spaces.       
        r = randi([-3, 3]); 
        if (j + r) > popsize 
            shift = (j+r) - popsize;
        elseif (j + r) <1
            shift = (j+r) + popsize;
        else
            shift = j + r;
        end
               
        ind1 = pop2(j,:,:);
        ind2 = pop1(shift,:,:);
        fit1 = run(nbots, nsteps, ind1, nr);
        fit2 = run(nbots, nsteps, ind2, nr);
        
        if fit1 > fit2
            for k = 1 : nbots
                pop1(shift,:,k) = botmutate(crossover(ind1(:,:,k),ind2(:,:,k)));
            end
                                  
            if fit1 > bestP2
                bestP2 = fit1;            
            end  
            
        elseif fit1 < fit2  
            for k = 1: nbots
                pop2(j,:,k) = botmutate(crossover(ind1(:,:,k),ind2(:,:,k)));
            end
        else
            for k = 1: nbots
                pop2(j,:,k) = botmutate(ind1(:,:,k));
                pop1(shift,:,k) = botmutate(ind2(:,:,k));
            end   
        end
        
    end
    
 
    
end

plot(bestP1i)
hold on
plot(bestP2i)
hold off




