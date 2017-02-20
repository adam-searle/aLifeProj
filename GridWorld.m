function [ Grid ] = GridWorld( n,r )
%GridWorld generates an n by n grid of zeros surround by ones
%With 2 types of resources in 2 places, so 4 resource 'squares'.

Grid = ones(n,n);
Grid(:,1) = zeros; Grid(1,:) = zeros; Grid(:,n) = zeros; Grid(n,:) = zeros;
Grid = GenerateResources(Grid,r);


end

