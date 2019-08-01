load('TrainDataWithFragmentSequence.mat')
load('aafFeature.mat')

trainClass=cellfun(@str2double, ptmNonPtmSiteTrain);
trainData=aafFeature;

norTrainData=normalize_max(trainData); %normalize the data to the [-1,1] range
discritizedNormalizedTrainData=myQuantileDiscretize(norTrainData,10); %discretize the data to 5 equal-frequency bins

selectedFeatureIndex=mrmr_mid_d(discritizedNormalizedTrainData, trainClass, 100);

aaf_selected_feature_mRMR=aafFeature(:, selectedFeatureIndex);

save aaf_selected_feature_mRMR.mat aaf_selected_feature_mRMR


load('TrainDataWithFragmentSequence.mat')
load('binaryFeature.mat')


trainClass=cellfun(@str2double, ptmNonPtmSiteTrain);
trainData=binaryFeature;

norTrainData=normalize_max(trainData); %normalize the data to the [-1,1] range
discritizedNormalizedTrainData=myQuantileDiscretize(norTrainData,10); %discretize the data to 5 equal-frequency bins

selectedFeatureIndex=mrmr_mid_d(discritizedNormalizedTrainData, trainClass, 100);

binary_selected_feature_mRMR=binaryFeature(:, selectedFeatureIndex);

save binary_selected_feature_mRMR.mat binary_selected_feature_mRMR


load('TrainDataWithFragmentSequence.mat')
load('CKSAAP_Feature.mat')

trainClass=cellfun(@str2double, ptmNonPtmSiteTrain);
trainData=CKSAAP_Feature;

norTrainData=normalize_max(trainData); %normalize the data to the [-1,1] range
discritizedNormalizedTrainData=myQuantileDiscretize(norTrainData,10); %discretize the data to 5 equal-frequency bins

selectedFeatureIndex=mrmr_mid_d(discritizedNormalizedTrainData, trainClass, 300);

CKSAAP_selected_feature_mRMR=CKSAAP_Feature(:, selectedFeatureIndex);

save CKSAAP_selected_feature_mRMR.mat CKSAAP_selected_feature_mRMR


load('TrainDataWithFragmentSequence.mat')
load('PSAAP_Feature.mat')

trainClass=cellfun(@str2double, ptmNonPtmSiteTrain);
trainData=PSAAP_Feature;

norTrainData=normalize_max(trainData); %normalize the data to the [-1,1] range
discritizedNormalizedTrainData=myQuantileDiscretize(norTrainData,10); %discretize the data to 5 equal-frequency bins

selectedFeatureIndex=mrmr_mid_d(discritizedNormalizedTrainData, trainClass, 15);

PSAAP_selected_feature_mRMR=PSAAP_Feature(:, selectedFeatureIndex);

save PSAAP_selected_feature_mRMR.mat PSAAP_selected_feature_mRMR


