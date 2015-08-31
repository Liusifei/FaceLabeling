function [big_patch,big_edge] = T3_ImageRemap16(active_fc)

[r,c,ch,ml] = size(active_fc);
active_edge = zeros(r,c,ml);
active_patch = zeros(ch-1,r*c,ml);
big_edge = zeros(4*r+1,4*c+1);

big_patch = zeros(4*r+1,4*c+1,ch-1);

for m = 1:ml
    active_edge(:,:,m) = T1_logistic(active_fc(:,:,end,m));
    active = reshape(active_fc(:,:,:,m),[r*c,ch])';
    active_patch(:,:,m) = T3_softmax(active(1:ch-1,:));
    
    edge = active_edge(:,:,m)';
    patch = permute(reshape(active_patch(:,:,m)',[r c ch-1]),[2 1 3]);
    
    [iy,ix] = ind2sub([4,4],m);
    [x,y] = meshgrid(ix+1:4:4*r+1,iy+1:4:4*c+1);
    big_edge(sub2ind([4*r+1 4*c+1],y(:),x(:))) = edge;
    for cc = 1:ch-1
        big = big_patch(:,:,cc);
        big(sub2ind([4*r+1 4*c+1],y(:),x(:))) = patch(:,:,cc);
        big_patch(:,:,cc)=big;
    end
end
big_edge = big_edge(1:end-1,1:end-1);
big_patch = big_patch(1:end-1,1:end-1,:);
