% Face3_demo.m
addpath(genpath('../'));
solver = 'lfw03_solver_exemplar';
%% settings and init
proto_path = '../../../examples/LFW_cvpr15/';
solver_file = fullfile(proto_path,[solver,'.prototxt']);
solver_mat = fullfile(proto_path,[solver,'.mat']);
if caffe('is_initialized') ~= 2
    Solver = Face3Init_01(solver_file, solver_mat);
end
if exist('LFW_EP_EX_MEAN.mat','file')
    load LFW_EP_EX_MEAN.mat LFW_EP_MEAN
else
    LFW_EP_MEAN = 100*ones(1,6);
end
parm.patchsize = 72;
parm.mini_batch = 1;
parm.imsize = 250;
parm.amp = 100;
parm.mean = LFW_EP_MEAN;
parm.result_path = 'Results/';
if ~exist(parm.result_path,'dir')
    mkdir(parm.result_path);
end
%% test
img = single(imread('img2.png'));
fout = fopen('shape2.txt','r');
shape = fscanf(fout, '%d %d\n',[2 5]);
fclose(fout);
lab = Face3Classes(img, shape, parm);
save(fullfile(parm.result_path,'lab.mat'),'lab');
