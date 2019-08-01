
clear all;
clc;

load indianPinesTwoD
load class_IndianPines

data = indianPinesTwoD;
class = class_indianPines;


dataIndex=ismember(class,[2,3,5,6,8,10,11,12,14]);

dataWithNineClass=data(dataIndex,:);
nineClass=class(dataIndex,:);

 classIndexOne=ismember(nineClass,2);
 classIndexTwo=ismember(nineClass,3);
 classIndexThree=ismember(nineClass,5);
 classIndexFour=ismember(nineClass,6);
 classIndexFive=ismember(nineClass,8);
 classIndexSix=ismember(nineClass,10);
 classIndexSeven=ismember(nineClass,11);
 classIndexEight=ismember(nineClass,12);
 classIndexNine=ismember(nineClass,14);


 nineClass(classIndexOne)=1;
 nineClass(classIndexTwo)=2;
 nineClass(classIndexThree)=3;
 nineClass(classIndexFour)=4;
 nineClass(classIndexFive)=5;
 nineClass(classIndexSix)=6;
 nineClass(classIndexSeven)=7;
 nineClass(classIndexEight)=8;
 nineClass(classIndexNine)=9;
 
 save dataWithNineClass dataWithNineClass nineClass
 
 
