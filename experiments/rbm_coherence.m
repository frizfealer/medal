function [ ] = rbm_coherence()
%rbm_coherence the experiment script on coherence of rbm.
fprintf('\nHere we train an RBM with Binary inputs (MNIST datastet).\n');

% LOAD DATASET
load('mnistSmall.mat');
[nObs,nVis] = size(trainData);
nHid = 500; % 500 HIDDEN UNITS
% DEFINE A MODEL ARCHITECTURE
arch = struct('size', [nVis,nHid], 'classifier',true, 'inputType','binary');
% GLOBAL OPTIONS
arch.opts = {'verbose', 1, ...
		 'lRate', 0.1, ...
		'momentum', 0.5, ...
		'nEpoch', 100, ...
		'wPenalty', 0.02, ...
		'batchSz', 100, ...
		'beginAnneal', 10, ...
		'nGibbs', 1, ...
		'sparsity', 0.01, ...
		'varyEta',7, ...
		'displayEvery', 20, ...
        'betaForSoftmax', 10, ...
        'cohPenalty', 0};
%  		'visFun', @visBinaryRBMLearning};
% INITIALIZE RBM
r{1} = rbm(arch);

% TRAIN THE RBM
r{1} = r{1}.train(trainData,single(trainLabels));

cohVec = [1 10 100 1e3 1e4 1e5 1e6 1e7];
for i = 1:length(cohVec)
    arch.opts{end} = cohVec(i);
    r{i+1} = rbm(arch);
    r{i+1} = r{i+1}.train(trainData,single(trainLabels));
end



end

