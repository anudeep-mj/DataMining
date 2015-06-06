
clear *

addpath(genpath('C:\libsvm'));

addpath(genpath('C:\libsvm\matlab'));

load('Data02TrainP1.mat')
load('Data02TestP1.mat')
load('Label02TestP1.mat')
load('Label02TrainP1.mat')

model = svmtrain(Label02TrainP1, Data02TrainP1, '-c 1 -t 0');


%[predicted_label, accuracy, decision_values/prob_estimates] = svmpredict(Label01TestP1, Data01TestP1, model);

[predicted_label] = svmpredict(Label02TestP1, Data02TestP1, model);

%options.Maxiter = 10000    svmtrain(data, label, 'Options',options)
%svmclassify(model, allmatrix)
