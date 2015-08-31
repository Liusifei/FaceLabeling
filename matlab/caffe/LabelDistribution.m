function dislabel = LabelDistribution(translabel)

[r,c,kn] = size(translabel);
dislabel = zeros(r,c,3);
for m = 1:r
    for n = 1:c
        dislabel(m,n,1) = length(find(translabel(m,n,:)==1))/kn;
        dislabel(m,n,2) = length(find(translabel(m,n,:)==2))/kn;
        dislabel(m,n,3) = length(find(translabel(m,n,:)==3))/kn;
    end
end

end