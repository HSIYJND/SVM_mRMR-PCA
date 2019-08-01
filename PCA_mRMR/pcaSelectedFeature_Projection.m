clear all;
clc;

load meanCenteredData
load pcaData

pcaSelectedFeature = newTrainProjectedData(:,1:220);

testDataIndependentOnPc = testDataIndependentCenter*newTrainPc;
pcaProjectedTestDataIndependent = testDataIndependentOnPc(:,1:220);


testDataValidationOnPc = testDataValidationCenter*newTrainPc;
pcaProjectedTestDataValidation = testDataValidationOnPc(:,1:220);


save pcaSelectedFeature pcaSelectedFeature 
save projectedDataOnPc pcaProjectedTestDataIndependent pcaProjectedTestDataValidation
