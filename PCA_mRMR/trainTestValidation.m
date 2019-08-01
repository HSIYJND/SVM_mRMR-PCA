
clear all;
clc;

load trainTestInitial

data = trainDataInitial;
groups = trainClassInitial;

[train test] = crossvalind('holdout',groups,0.375);

newTrainData = data(train,:);
testDataValidation = data(test,:);
newTrainClass = groups(train,:);
testClassValidation = groups(test,:);

save trainTestValidation newTrainData testDataValidation newTrainClass testClassValidation


 [n,p] = size(testDataValidation);
 testDataValidationCenter = testDataValidation - repmat(mean(newTrainData,1),n,1);

 [r,c] = size(testDataIndependent);
 testDataIndependentCenter = testDataIndependent - repmat(mean(newTrainData,1),r,1);

 save meanCenteredData testDataValidationCenter testDataIndependentCenter
 