function [ R ] = RQuant(r,nR) %Generate random quantity of resource for corresponding resource.
e = 2; f = 11; %for random resource A
g = 12; h = 21; %for random resource B  
    if r <= nR
        R =(round((f-e)*rand(1)+e));
    end
    
    if r >nR
        R =(round((h-g)*rand(1)+g));
    end
    
end