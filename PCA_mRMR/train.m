clear all;
clc;

load mRMR_selectedFeature
load trainTestValidation
load c_and_sigma

uniqueClass = unique(newTrainClass);
c = 2^bestC;
sig = 2^bestSigma;


tic
for i=1:size(uniqueClass,1)       
    groups = ismember(newTrainClass, uniqueClass(i));       
    opts = statset('Display','final','MaxIter',500000);
    svmStructRbf(i) = svmtrain(mRMR_selected_feature5,groups,'Method','SMO','SMO_Opts',opts,'BoxConstraint', c, 'Kernel_Function','rbf', 'RBF_Sigma', sig,'KernelCacheLimit',10000);
end
toc

save svmrbf.mat  svmStructRbf;
