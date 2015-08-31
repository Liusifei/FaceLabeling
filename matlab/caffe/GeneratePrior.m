function ex = GeneratePrior(shape)
%%
datafolder = '../../../data/LFW';
folder_valid = fullfile(datafolder, 'validate');
vfoldername = folder_valid;
svalidimagedir = dir(fullfile(folder_valid, '*.txt'));
[validlist,vumlist] = textread(fullfile(datafolder,'map.txt'),'%s %s',500);
load pca_shape4lfw_valid.mat all_coef mean_shape U S all_tform
w = [0 1 1 1 1 1 1];
kn = 10;
%% cal pca subspace
shape = reshape(shape',[10,1]);
[shape_new] = T1_GeneratingTrom(shape,mean_shape);
coef = U'*shape_new;
coef_dist = sqrt( w *(repmat(coef,[1,size(all_coef,2)])-all_coef).^2);
[~,index] = sort(coef_dist); % rank of most similar poses in training set
%% on validation set
for n = 1:kn
    m = index(n);
    numim = svalidimagedir(m).name;
    numim_shortss = numim(1:end-4);
    imnamess = validlist{strcmp(vumlist,[numim_shortss,'.jpg'])==1};
    imname_shortss = imnamess(1:end-4);
    ptnamess = numim;
    labnamess = [imname_shortss,'.mat'];
    labelss = load(fullfile(vfoldername, labnamess));
    ex(:,:,n) = labelss.label;
%     fout = fopen(fullfile(folder_valid, ptnamess),'r');
%     xss = fscanf(fout, '%d %d\n',[2 5]);
%     fclose(fout);
%     IMshape = reshape(xss',[10,1]);
%     
%     [~,kn_tform] = T1_GeneratingTrom(IMshape,shape);
%     translabel(:,:,n) = imtransform(labelss, kn_tform,'XYScale',1,...
%         'XData',[1 size(labelss,2)], 'YData',[1 size(labelss,1)],'fill',1);
end
ex = LabelDistribution(ex);
