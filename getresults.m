function [ind1picks1, ind2picks1, sharedpicks1, ind1picks2, ind2picks2, sharedpicks2, highest] = getresults(pop, nbots,nsteps, nr)
%getresults
%Takes a population and gives forage info.

population = pop;
maxfitness = zeros(50,50);
for j = 1:50
    
    for i = 1:50
        maxfitness(j,i) = run(nbots,nsteps,population(j,:,:), nr);
    end
    
end    

[~,highest] = max(sum(maxfitness,2)/50);
best = population(highest,:,:);

ind1picks1 = 0;
ind2picks1 = 0;
sharedpicks1 = 0;
ind1picks2 = 0;
ind2picks2 = 0;
sharedpicks2 = 0;


%want to add ***
%for each "resource", how is it seen.
%need to add checking if 1 or 2 is pick up.
%need to add comparing 

if nbots >1
for i = 1:64 %for pairs (add if statement later, and/or change to cycle through 1 bot instead of 2)
        
    if best(:,i,1) == 6
       ind1picks1 = ind1picks1 + 1; 
    end
    
    
    if best(:,i,2) == 6
        ind2picks1 = ind2picks1 + 1;
        
        if best(:,i,1) == 6
           sharedpicks1 = sharedpicks1 + 1; 
        end
            
    end   
        
end

for i = 64:128 %for pairs (add if statement later, and/or change to cycle through 1 bot instead of 2)
        
    if best(:,i,1) == 6
       ind1picks2 = ind1picks2 + 1; 
    end
    
    
    if best(:,i,2) == 6
        ind2picks2 = ind2picks2 + 1;
        
        if best(:,i,1) == 6
           sharedpicks2 = sharedpicks2 + 1; 
        end
            
    end   
        
end
end


end

