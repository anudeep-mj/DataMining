%clear, clc;

clear *

addpath(genpath('C:\SLEP'));
                     % add the functions in the folder SLEP to the path
%load('LabelOfData10Train.mat')
%load('LabelOfData10Test.mat')
%load('DataOfLabel10Train.mat')
%load('DataOfLabel10Test.mat')

load('Data01TrainP1.mat')
load('Data01TestP1.mat')
load('Label01TestP1.mat')
load('Label01TrainP1.mat')

m=10;  n=10;    % The data matrix is of size m x n

%A = randn(m, n);
X_Train = Data01TrainP1;
%Y_Train = randn(m, 1);
Y_Train = Label01TrainP1;
Y_TrainLR = Y_Train;
Y_TrainLR(Y_Train > 0) = 1;
Y_TrainLR(Y_Train == 0) = -1;
%B = randn (20, n);
X_Test = Data01TestP1;

prompt = 'What is the z value? ';
z = input(prompt)
%z = 1;
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

rho = 0.8;
%case LogisticR
    W = LogisticR(X_Train, Y_TrainLR, z, opts);
%case LeastR
%    W = LeastR(X_Train , Y_Train, rho, opts);

Votes = X_Test * W;
Y_Predict = sign(Votes);

Y_Test = Label01TestP1;
Y_TestLR = Y_Test;
Y_TestLR(Y_Test > 0) = 1;
Y_TestLR(Y_Test == 0) = -1;

ansr = Y_TestLR == Y_Predict;
sizeTotal = size(ansr);
sizeTotal = sizeTotal(1);
numeratorOfComparison = sum(ansr == 1);
Simil = numeratorOfComparison/sizeTotal
