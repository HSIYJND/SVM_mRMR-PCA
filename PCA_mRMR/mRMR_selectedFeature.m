
clear all;
clc;

load trainTestValidation
load trainTestInitial

tic
norTrainData = normalize_max( newTrainData ); %normalize the data to the [-1,1] range

%%%%Data discritized to 5 equal frequency bins
discritizedNormalizedTrainData5 = myQuantileDiscretize(norTrainData,5); %discretize the data to 5 equal-frequency bins

selectedFeatureIndex5 = mrmr_mid_d(discritizedNormalizedTrainData5, newTrainClass, 150);

mRMR_selected_feature5 = newTrainData(:, selectedFeatureIndex5);
testDataValidationRanked_mRMR5 = testDataValidation(:,selectedFeatureIndex5);
testDataIndependentRanked_mRMR5 = testDataIndependent(:,selectedFeatureIndex5);

featureRankmRMR5 = selectedFeatureIndex5';



%%%%Data discritized to 10 equal frequency bins
discritizedNormalizedTrainData10 = myQuantileDiscretize(norTrainData,10); %discretize the data to 10 equal-frequency bins

selectedFeatureIndex10 = mrmr_mid_d(discritizedNormalizedTrainData10, newTrainClass, 100);

mRMR_selected_feature10 = newTrainData(:, selectedFeatureIndex10);
testDataValidationRanked_mRMR10 = testDataValidation(:,selectedFeatureIndex10);
testDataIndependentRanked_mRMR10 = testDataIndependent(:,selectedFeatureIndex10);

featureRankmRMR10 = selectedFeatureIndex10';
toc

% save mRMR_selectedFeature mRMR_selected_feature5 mRMR_selected_feature10 testDataValidationRanked_mRMR5 testDataValidationRanked_mRMR10 testDataIndependentRanked_mRMR5 testDataIndependentRanked_mRMR10
% save mRMR_selectedFeatureRank featureRankmRMR5 featureRankmRMR10

