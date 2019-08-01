
clear all;
clc;

load trainTestValidation

data = newTrainData;
groups = newTrainClass;

[pc,co_ordinateOnPc,variance] = pca(newTrainData);

%  [n,p] = size(testData);
%  testDataCenter = testData - repmat(mean(newTrainData,1),n,1);
%  testDataOnPc = testDataCenter*validPc;

newTrainPc = pc;
newTrainProjectedData = co_ordinateOnPc;

% newTrainData = trainDataOnPc(:,1:220);
% testData = testDataOnPc(:,1:220);
% trainClass = groups(train,:);
% testClass = groups(test,:);

save pcaData newTrainPc newTrainProjectedData variance


