
clear all;
clc;

tic
load mRMR_selectedFeature
load trainTestValidation

cMinValue = -6;
cMaxValue = 6;
sigmaMinValue = -6;
sigmaMaxValue = 6;

cinv = 1;
sinv = 2;
a = 1;
bestOverallAccuracy = 0;

numOfMetric = 4;
dimC = cMaxValue - cMinValue + 1;
dimSigma = sigmaMaxValue - sigmaMinValue + 1;

uniqueClass = unique(newTrainClass);
predictionList = zeros(size(testClassValidation, 1), 1);
performanceInfo = zeros(dimC, dimSigma, numOfMetric);


for cVal = cMinValue : cinv : cMaxValue
   actualC=2^cVal;
   b = 1;

   for sigmaVal = sigmaMinValue : sinv : sigmaMaxValue
      actualSigma=2^sigmaVal;
      
      st = tic;
      
      for i=1:size(uniqueClass,1)
          groups = ismember(newTrainClass, uniqueClass(i));
          opts = statset('Display','final','MaxIter', inf);
          svmStruct(i) = svmtrain(mRMR_selected_feature5,groups,'Method','SMO','SMO_Opts',opts,'BoxConstraint', actualC, 'Kernel_Function','rbf', 'RBF_Sigma', actualSigma,'KernelCacheLimit',10000);
      end
      
      prediction = predictTestClass(svmStruct, testDataValidationRanked_mRMR5, uniqueClass);
    
      [overallAccuracy, accuracyPerClass] = performanceMeasure(prediction, testClassValidation);
      
      performanceInfo(a, b, 1) = cVal;
      performanceInfo(a, b, 2) = sigmaVal;
      performanceInfo(a, b, 3) = overallAccuracy;
      accuracyPerClass;
      
      if bestOverallAccuracy < overallAccuracy
          bestOverallAccuracy = overallAccuracy;
      end
      
      fprintf('\n\nactualC = %d  actualSigma = %d\ncVal = %d  sigmaVal = %d\noverallAccuracy = %d bestAccuracy = %d\n', actualC, actualSigma, cVal, sigmaVal, overallAccuracy, bestOverallAccuracy);

      toc(st)
            
      b = b + 1;
   end
   a = a + 1;
end

bestC = 1;
bestSigma = 1;
accuracy = 0.0;

for i = 1:dimC
   for j = 1:dimSigma
      if accuracy < performanceInfo(i,j,3)
         accuracy = performanceInfo(i,j,3);
         bestC = performanceInfo(i, j, 1);
         bestSigma = performanceInfo(i, j, 2);
      end
   end
end

fprintf('Best c = %d and Best sigma = %d\n', bestC, bestSigma);

toc

save c_and_sigma.mat bestC bestSigma
