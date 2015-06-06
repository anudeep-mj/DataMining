label = csvread('Baseline1_Testing(1).csv');
BL1TestCF = label(:,[1:2416]);
save BL1TestCommonFeatures BL1TestCF
BL1TestU = label(:,[2417:3171]);
save BL1TestUniqueFeatures BL1TestU


label = csvread('Baseline1_Training.csv');
BL1TrainCF = label(:,[1:2416]);
save BL1TrainingCommonFeatures BL1TrainCF
BL1TrainU = label(:,[2417:3171]);
save BL1TrainingUniqueFeatures BL1TrainU


data = csvread('Baseline2_Training.csv');
BL2TrainCF = data(:,[1:2416]);
save BL2TrainingCommonFeatures BL2TrainCF
BL2TrainU = data(:,[2417:2553]);
save BL2TrainingUniqueFeatures BL2TrainU

data = csvread('Baseline2_Testing.csv');
BL2TestCF = data(:,[1:2416]);
save BL2TestCommonFeatures BL2TestCF
BL2TestU = data(:,[2417:2553]);
save BL2TestUniqueFeatures BL2TestU

load bl1TrainingCommonFeatures
p1 = ans;
load bl2TrainingCommonFeatures
p2 = ans;
p3 = p1 + p2;
p3 = p3/2;

label1 = csvread('Baseline1_Training.csv');
label2 = csvread('Baseline2_Training.csv');
Fullmatrix = [label1,label2];
save BLFullTrainingData Fullmatrix 



load('BL1TestUniqueFeatures.mat')
load('BL1TrainingUniqueFeatures.mat')
BL1U = ans;
BL1U = ans;
load('BL2TrainingUniqueFeatures.mat')
BL2U = ans;

load('BLCommonFeaturesAVG.mat')
Final = [BL1U, p3, BL2U];
label = csvread('Training_Label.csv');
SVMModel = fitcsvm(Final,label);




load('BL1TrainingUniqueFeatures.mat')
load('BL2TrainingUniqueFeatures.mat')
load('BL2TrainingCommonFeatures.mat')
load('BL1TrainingCommonFeatures.mat')
BL1TrainCFWeight0point2 = BL1TrainCF*0.2;
BL1TrainUWeight0point2 = BL1TrainU*0.2;
BL2TrainCFWeight0point8 = BL2TrainCF*0.8;
BL2TrainUWeight0point8 = BL2TrainU*0.8;

BLTrainCFWeight0208 = (BL1TrainCFWeight0point2 + BL2TrainCFWeight0point8)/2;

