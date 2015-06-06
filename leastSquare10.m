%clear, clc;
clear *
load('Data12TrainP3.mat')
load('Data12TestP3.mat')
load('Label12TestP3.mat')
load('Label12TrainP3.mat')
    
for index = 1:21
   

parameters = [0.005,0.01,0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.40,0.45,0.5,0.55,0.6,0.65,0.7,0.75,0.8,0.85,0.9,0.95];


addpath(genpath('C:\SLEP'));
                     % add the functions in the folder SLEP to the path
                     
%load('LabelOfData10TrainP1.mat')
%load('LabelOfData10Test.mat')
%load('DataOfLabel10TrainP1.mat')
%load('DataOfLabel10Test.mat')



% m=10;  n=10;    % The data matrix is of size m x n

%A = randn(m, n);
X_Train = Data12TrainP3;
%Y_Train = randn(m, 1);
Y_Train = Label12TrainP3;
Y_TrainLR = Y_Train;
Y_TrainLR(Y_Train == 2) = 1;
Y_TrainLR(Y_Train == 1) = -1;
%B = randn (20, n);
X_Test = Data12TestP3;

%prompt = 'What is the rho value? ';
%rho = input(prompt)

z = parameters(index)

%z = 0.1;
%----------------------- Set optional items ------------------------
opts=[];

% Starting point
opts.init=2;        % starting from a zero point

% termination criterion
opts.tFlag=5;       % run .maxIter iterations
opts.maxIter=100;   % maximum number of iterations

% normalization
opts.nFlag=0;       % without normalization

% regularization
opts.rFlag=1;       % the input parameter 'rho' is a ratio in (0, 1)
%opts.rsL2=0.01;     % the squared two norm term

%rho = 0.05;
%case LogisticR
    W = LogisticR(X_Train, Y_TrainLR, z, opts);
%case LeastR
%    W = LeastR(X_Train , Y_TrainLR, rho, opts);

Votes = X_Test * W;
Y_Predict = sign(Votes);

Y_Test = Label12TestP3;
Y_TestLR = Y_Test;
Y_TestLR(Y_Test == 2) = 1;
Y_TestLR(Y_Test == 1) = -1;

ansr = Y_TestLR == Y_Predict;
sizeTotal = size(ansr);
sizeTotal = sizeTotal(1);
numeratorOfComparison = sum(ansr == 1);
index
Simil = numeratorOfComparison/sizeTotal

Accuracy(index) = Simil;

end
