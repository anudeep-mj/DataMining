clear, clc;

addpath(genpath('C:\SLEP'));
                     % add the functions in the folder SLEP to the path
                   


m=10;  n=10;    % The data matrix is of size m x n

A = randn(m, n);
Y_Train = randn(m, 1);
Y_TrainLR = Y_Train;
Y_TrainLR(Y_Train > 0) = 1;
Y_TrainLR(Y_Train < 0) = -1;
B = randn (20, n);

z = 0.8;
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

rho = 0.5;
%case LogisticR
%    W = LogisticR(A, Y_TrainLR, z, opts);
%case LeastR
    W = LeastR(A , Y_Train, rho);

Votes = B * W;
Y_Predict = sign(Votes);


        
