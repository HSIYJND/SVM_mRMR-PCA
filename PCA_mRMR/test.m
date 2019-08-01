
clear all;
clc;

load mRMR_selectedFeature
load trainTestInitial
load svmrbf

tic

svmStruct = svmStructRbf;
uniqueClass = unique(testClassIndependent);
testClassName = testClassIndependent;
groundTruth = testClassName;

class = zeros(size(testClassName,1),size(uniqueClass,1));
fvalue = zeros(size(testClassName,1),size(uniqueClass,1));
dataTest = testDataIndependentRanked_mRMR5;

for i=1:size(uniqueClass,1)         
    [class(:,i), fvalue(:,i)] =svmclassifyfvalue(svmStruct(i), dataTest);
end

outputClassName=zeros(size(testClassName,1),1);
for j=1:size(testClassName,1)
    min=fvalue(j,1);
    position=1;
    for i=2:size(uniqueClass, 1)                
        if( min>fvalue(j,i))
            min=fvalue(j,i);
            position=i;
        end
    end            
    outputClassName(j)=position;
end

testIndex=logical(groundTruth);
cp = classperf(groundTruth);
classperf(cp,outputClassName,testIndex);
cp.CorrectRate

toc

