function Solver = Face3Init_01( model_def_file, resume_file)
% Bird test
if ~exist('model_def_file','var')
    error('You need a network prototxt definition');
end
if ~exist('resume_file','var') || isempty(resume_file)
    error('You need a resume file!');
end
Solver = T1_SolverParser(model_def_file,resume_file);
caffe('init', Solver.net, 'test');
layers = Solver.model;
caffe('set_weights',layers,'test');
fprintf('Set weights done...\n');
fprintf('Done with init\n');

%% GPU
if strcmp(Solver.solver_mode,'GPU')
    fprintf('Using GPU Mode\n');
    caffe('set_mode_gpu');
    caffe('set_device',Solver.device_id);
else
    fprintf('Using CPU Mode\n');
    caffe('set_mode_cpu');
end
caffe('get_device');
fprintf('Done with set mode\n');

%% put into train mode
fprintf(sprintf('Solving net: %s\n',model_def_file));
fprintf(sprintf('Learning rate: %d\n',Solver.base_lr));

end
