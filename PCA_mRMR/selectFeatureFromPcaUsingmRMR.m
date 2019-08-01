
clear all;
clc;

load pcaSelectedFeature
load projectedDataOnPc
load trainTestValidation
load meanCenteredData
load pcaData

norTrainData = normalize_max( pcaSelectedFeature ); %normalize the data to the [-1,1] range
discritizedNormalizedTrainData = myQuantileDiscretize(norTrainData,5); %discretize the data to 5 equal-frequency bins

selectedFeatureIndex = mrmr_mid_d(discritizedNormalizedTrainData, newTrainClass, 10);

mRMR_selected_feature = pcaSelectedFeature(:, selectedFeatureIndex);

featureRank = selectedFeatureIndex';

testDataValidationRanked_mRMR = pcaProjectedTestDataValidation(:, selectedFeatureIndex);

testDataIndependentRanked_mRMR = pcaProjectedTestDataIndependent(:,selectedFeatureIndex);

save mRMR_selectedBandsRank featureRank
save mRMR_selected_feature mRMR_selected_feature testDataValidationRanked_mRMR testDataIndependentRanked_mRMR


