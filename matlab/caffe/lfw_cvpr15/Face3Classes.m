function lab = Face3Classes(img, shape, parm)
%result_path = parm.result_path;
w2 = 0.1;
[input,ex] = processIm_lfw(img, parm, shape);
for m = 1:16
    b_img = input(:,:,:,m);
    % forward and get the output
    active = caffe('forward_test', {single(b_img)});
    active_fc(:,:,:,m) = squeeze(active{1});
end
save out2.mat input active_fc
[big_patch,big_edge] = T3_ImageRemap16(active_fc);
%% resize
big_edge = imresize(big_edge,[parm.imsize+2 parm.imsize+2],'bilinear');
lab.big_edge = big_edge(2:end-1,2:end-1);
big_patch = imresize(big_patch,[parm.imsize+2 parm.imsize+2],'bilinear');
lab.big_patch = big_patch(2:end-1,2:end-1,:);
%% GC
%lab.big_gc= T3_GCcaffe_image_test(lab.big_patch, lab.big_edge, ex, w2);
%% save images
%save(fullfile(result_path,'lab.mat'),'lab');
