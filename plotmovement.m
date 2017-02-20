function [ Pts ] = plotmovement(nBots, nsteps, genotype, nr)
%This version of run also plots a bots movement on a grid
%one run through the world for given genotype(s), aka fitness function. 
%If comparing more than 1 bot, scores are combined minus the difference
%to enforce co-operation

W = GridWorld(12,nr);
botloc = zeros(nBots,2);
Pts = zeros(1,nBots);
plotbotloc = zeros((nsteps+1),2,nBots);

for i = 1 : nBots
    botloc(i,:) = round((11-2)*rand(1,2)+2);
    plotbotloc(1,:,i) =  botloc(i,:);
end


for i = 1 : nsteps %Each step for a given bot

    for j = 1 : nBots %For each step, take action on each bot.
        
    x = P(W, botloc(j,:), genotype(:,:,j));
    g = D(x, genotype(:,:,j));
    [W, botloc(j,:), Pts(j)] = A(W, botloc(j,:), g, Pts(j));
    
    plotbotloc((i+1),:,j) = botloc(j,:);
        
    end
    
end
    if nBots >= 2 %for multiple bots combined fitness
        Pts = (sum(Pts)) - (mean(abs(diff(Pts))));
    end
    
    figure
    hold on
    for i = 1:nsteps
    p1 = plotbotloc(i,:,1);
    p2 = plotbotloc(i+1,:,1);
    dp = p2-p1;
    if i == 1 %start point
       q = quiver(p1(1),p1(2),0,0,0,'rs');
       c = q.MarkerSize;
       q.MarkerSize = 15
    end
    if dp == 0
        q = quiver(p1(1),p1(2),dp(1),dp(2),0,'mo');
        c = q.MaxHeadSize;
        q.MaxHeadSize = .5;
    else
        q = quiver(p1(1),p1(2),dp(1),dp(2),0,'r');
        c = q.MaxHeadSize;
        q.MaxHeadSize = .5;
    end
    
    if nBots > 1
    b1 = plotbotloc(i,:,2);
    b2 = plotbotloc(i+1,:,2);
    bp = b2-b1;
    if i == 1 %start point
       q = quiver(b1(1),b1(2),0,0,0,'bs');
       c = q.MarkerSize;
       q.MarkerSize = 15
    end
    if bp == 0
        q = quiver(b1(1),b1(2),bp(1),bp(2),0,'co');
        c = q.MaxHeadSize;
        q.MaxHeadSize = .5;
    else
        q = quiver(b1(1),b1(2),bp(1),bp(2),0,'b');
        c = q.MaxHeadSize;
        q.MaxHeadSize = .5;
    end
    end
% plot(plotbotloc(i,1,2),plotbotloc(i,2,2),'bx')
    end
    
    xlabel('X Co-Ordinates');
    ylabel('Y Co-Ordinates');
    title('Movement Plot');
    axis([1,12,1,12])
    grid;
    hold off
end


