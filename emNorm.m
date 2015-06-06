%clear, clc;
clear *

SizeOfLoop = 50;
prompt = 'Please enter the k value:';
k = input(prompt)

constForInitCovar = 1;

[X, Y] = textread('dataset1.txt' , '%f %f');

[sizeX1, sizeX2] = size(X);
[sizeY1, sizeY2] = size(Y);


for i = 1:k,

randomNumber = round(rand(1)*sizeX1); %randdsample
Xmean(i) = X(randomNumber);
Ymean(i) = Y(randomNumber);
end
% random centroids initialized.

Xmean = transpose(Xmean);
Ymean = transpose(Ymean);
MeanMat = [Xmean, Ymean];   % initial mean matrix with mean for each of the cluster initialized.


% initMean = [Xmean, Ymean];
for i = 1:k,
MixCoeff(i) = 1/k;
end

MainData = [X, Y];
initCovar = constForInitCovar * cov(MainData); % initial covariance
covarMat = cell(k,1);
for j = 1:k,
    covarMat{j} = zeros(2,2);
end

for i = 1:k,
    covarMat{i} = initCovar;
end

I = 1;
TEMP_VAL = 10000000000000000000000;
% iter = 1000000000000000;
tempVal = 0;
LogLikeValArray = zeros(SizeOfLoop,1);

covarMat = covarMat';

for I = 1: SizeOfLoop,
%while(iter<0.1)

% covariance matrix initailized for each class
EstepMat = zeros(sizeX1, k);

for i = 1: k,
%    for j = 1:n,
    PdfValy = mvnpdf(MainData,MeanMat(i,:),covarMat{i});
%    EstepMat = [EstepMat PdfValy];
    EstepMat(:,i) = PdfValy(:,1)*MixCoeff(i);
end

EstepTemp = EstepMat;
EstepMat = diag(1./sum(EstepMat,2))*EstepMat;


%M STEP STARTS

%update Mean
for i = 1:k,
Xmean(i) = dot(EstepMat(:,i),X)/sum(EstepMat(:,i));
Ymean(i) = dot(EstepMat(:,i),Y)/sum(EstepMat(:,i));
end

MeanMat = [Xmean,Ymean];

%update Covar

covarUpdatedMat = cell(k,1);
for j = 1:k,
    covarUpdatedMat{j} = zeros(2,2);
    for i = 1:sizeX1,
        covarUpdatedMat{j} = covarUpdatedMat{j} + EstepMat(i,j) * ((MainData(i,:)' - MeanMat(j,:)') * (MainData(i,:)' - MeanMat(j,:)')');
    end
    covarMat{j} = covarUpdatedMat{j} / sum(EstepMat(:,j));
end



%updata mixcoeff
for i = 1:k,
MixCoeff(i) = (sum(EstepMat(:,i))/sizeX1);
end


%compute loglikelihood
logLikeVal = 0;
LogLikeValFinal = 0;
Xindex = zeros(sizeX1,1);

for i = 1:sizeX1,
    logLikeVal = 0;
    for j = 1:k,
        logLikeVal = logLikeVal + EstepTemp(i,j);
    end
    LogLikeValFinal = LogLikeValFinal + log(logLikeVal);
%    tempVal = tempVal +1;
%    LogLikeValFinal;
%    LogLikeValArray[i] = LogLikeValFinal;
end

%iter = TEMP_VAL - LogLikeValFinal;
TEMP_VAL = LogLikeValFinal;
LogLikeValArray(I) = LogLikeValFinal;


I = I +1;
Xindex(I) = I;
I
%MeanMat
end

plot(LogLikeValArray)
