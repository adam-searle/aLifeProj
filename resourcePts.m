function [ value ] = resourcePts( r )
%resourcePts Takes a resource and returns it fitness vaule

if r == 1 | r == 11 | r == 21
   value = 0;
   
elseif r == 2 | r == 12 | r == 10 | r == 20
    value = 1;
    
elseif r == 3 | r == 13 | r == 9 | r == 19
    value = 3;
    
elseif r == 4 | r == 14 | r == 8 | r == 18
    value = 6;
    
elseif r == 5 | r == 15 | r == 7 | r == 17
    value = 9;
    
elseif r == 6 | r == 16
    value = 10;   
    
end    

end

