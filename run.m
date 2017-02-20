function [Pts] = run(nBots, nsteps, genotype, nr)
%one run through the world for given genotype(s), aka fitness function. 
%If comparing more than 1 bot, scores are combined minus the difference
%to enforce co-operation
W = GridWorld(12,nr);
botloc = zeros(nBots,2);
Pts = zeros(1,nBots);

for i = 1 : nBots
    botloc(i,:) = round((11-2)*rand(1,2)+2);
end



for i = 1 : nsteps %Each step for a given bot

    for j = 1 : nBots %For each step, take action on each bot.
        
    x = P(W, botloc(j,:), genotype(:,:,j));
    g = D(x, genotype(:,:,j));
    [W, botloc(j,:), Pts(j)] = A(W, botloc(j,:), g, Pts(j));
    
        
    end
    
end
    if nBots >= 2 %for multiple bots combined fitness
        Pts = (sum(Pts)) - (mean(abs(diff(Pts))));
    end
end


