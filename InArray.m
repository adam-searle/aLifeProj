function [ bool ] = InArray(Rmat, newLoc) %Takes a 2x2, or larger, matrix and a vector, checks if that vector is anywhere in firt 2 rows.
bool = 0;
for j = 1 : length(Rmat)
    if newLoc(1) == Rmat(j,1)
        if newLoc(2) == Rmat(j,2)
           bool = 1; 
           break
        end
    end    
end
end