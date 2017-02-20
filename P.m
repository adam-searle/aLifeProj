function [x] = P(W, botloc, genotype)
%Perceptual Mapping from w(W) to x 
%Takes W and current location of bot
W = W;
botloc = botloc;
genotype = genotype;

x = zeros(5,2);
x(1,:) = botloc; %Current position of robot
x(2,:) = [(botloc(1) -1), botloc(2)]; %North
x(3,:) = [(botloc(1) +1), botloc(2)]; %South
x(4,:) = [(botloc(1)), (botloc(2) +1)]; %East
x(5,:) = [(botloc(1)), (botloc(2) -1)]; %West
    
%Gets content of square for bot perceptual space and assisngs.
c1 = x(1,1); c2 = x(1,2); c = W(c1,c2); %Center
n1 = x(2,1); n2 = x(2,2); n = W(n1,n2); %North
s1 = x(3,1); s2 = x(3,2); s = W(s1,s2); %South
e1 = x(4,1); e2 = x(4,2); e = W(e1,e2); %East
w1 = x(5,1); w2 = x(5,2); w = W(w1,w2); %West

%Translates resrouces into 'red'(1) or 'green'(2) corresponding to genotype.   
c = colorPerception(c, genotype);
n = colorPerception(n, genotype);
s = colorPerception(s, genotype);
e = colorPerception(e, genotype);
w = colorPerception(w, genotype);
    
x = [c,n,s,e,w];
end


