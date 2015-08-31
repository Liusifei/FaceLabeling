function [input,ex] = processIm_lfw(img, parm, shape)
% pad.top = 17;
% pad.left = 54;
% if size(img,1)~=320 || size(img,2)~=240
%     img = imresize(img,[320,240]);
% end
% img = imresize(img,0.6);
% [r,c,~] = size(img);
% new = zeros(parm.imsize,parm.imsize,3);
% new(pad.top+1:pad.top+r,pad.left+1:pad.left+c,:) = img;

ex = single(255 .* GeneratePrior(shape));
input = cat(3,img,ex);

% padding 252 -> 324, 16 images
input = T6_EPsharePadding(input,parm);
% input preprocessing
for kk = 1:6
    input(:,:,kk,:) = single(input(:,:,kk,:)) - parm.mean(kk);
end
% permute from RGB to BGR
input = input(:,:,[3 2 1 4:end],:);
% switch width with height
input = permute(input,[2 1 3 4]);
