function [ WA, botloc, Pts ] = A( W, botloc, d, Pts )
%A maps action onto world, using current bot location.
botloc = botloc;
WA = W;
Pts = Pts;

if d == 5 %Random step action
   d = (round((4-1)*rand(1)+1));   
end

    if d == 1 %North step action
        if W((botloc(1)-1),(botloc(2))) == 0 %checking for wall
            Pts = Pts -5;
        else    
        botloc(1) = (botloc(1) -1);
        end
        
    elseif d == 2 %South step action       
        if W((botloc(1)+1),(botloc(2))) == 0 %checking for wall
            Pts = Pts -5;
        else    
         botloc(1) = (botloc(1) +1);
        end
        
    elseif d == 3 %East step action
        if W((botloc(1)),(botloc(2)+1)) == 0 %checking for wall
            Pts = Pts -5;
        else    
         botloc(2) = (botloc(2) +1);
        end        
        
    elseif d == 4 %West step action
        if W((botloc(1)),(botloc(2)-1)) == 0 %checking for wall
            Pts = Pts -5;
        else    
         botloc(2) = (botloc(2) -1);
        end  
            
                          
    elseif d == 6 %Forage action
        Pts = (Pts + (resourcePts(WA((botloc(1)),(botloc(2))))));
        WA((botloc(1)),(botloc(2))) = 1;
        
        
    elseif d == 7 %Do nothing
        
    end

end

