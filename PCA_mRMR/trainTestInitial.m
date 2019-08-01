
clear all;
clc;


load dataWithNineClass

data = dataWithNineClass;
groups = nineClass;

[train, test] = crossvalind('holdOut',groups, 0.2);

trainDataInitial=data(train,:);
testDataIndependent=data(test,:);
trainClassInitial=groups(train,:);
testClassIndependent=groups(test,:);

save trainTestInitial trainDataInitial trainClassInitial testDataIndependent testClassIndependent
