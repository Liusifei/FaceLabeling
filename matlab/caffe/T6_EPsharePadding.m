function b_img = T6_EPsharePadding(img,parm)
% 16 images
num = 16;
%% settings
[r,c,cc] = size(img);
patchsize = parm.patchsize + 2;
b_img = zeros(r+patchsize,c+patchsize,cc,num);
b_img(:,:,4,:) = 255;

[s_x,s_y] = meshgrid(0:-1:-3);
s_x = s_x(:);s_y = s_y(:);

%% edge sample
for k = 1:num
    board_x = ceil(patchsize/2) + s_x(k);
    board_y = ceil(patchsize/2) + s_y(k);
    b_img(board_y+1:board_y+r,board_x+1:board_x+c,:,k) = img;
end
