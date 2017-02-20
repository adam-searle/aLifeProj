function [ w, Rmat ] = GenerateResources( W, nR )
%Resource Generator

Rmat = zeros(nR*2, 4); %Resrouce Matrix
%Rmat format: 1 & 2 = co,ords, 3 = quantity, 4 = number in list. 
a = 2; b = 11; %for random grid square
w = W;

for i = 1:nR
    Check = [Rmat(i,1) Rmat(i,2)];
    while (Rmat(i,1)  == Check(1)) & (Rmat(i,2) == Check(2))
        newLoc = (round((b-a)*rand(1,2)+a));
        if InArray(Rmat, newLoc) == 0
            Rmat(i,:) = [newLoc,RQuant(i,nR),i];
            [L1, L2] = loc(Rmat,i);
            w(L1,L2) = returnQ(Rmat,i);
        end
    end    
end
for i = nR+1:(nR*2)
    Check = [Rmat(i,1) Rmat(i,2)];
    while (Rmat(i,1)  == Check(1)) & (Rmat(i,2) == Check(2))
        newLoc = (round((b-a)*rand(1,2)+a));
        if InArray(Rmat, newLoc) == 0
            Rmat(i,:) = [newLoc,RQuant(i,nR),i];
            [L1, L2] = loc(Rmat,i);
            w(L1,L2) = returnQ(Rmat,i);
        end
    end 
end

end







