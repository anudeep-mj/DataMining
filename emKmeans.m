% clear, clc;
clear *                   
prompt = 'Please enter the k value:';
k = input(prompt)
SizeOfLoop = 50;
sizeOfKLoop = 25;

[X, Y] = textread('dataset1.txt' , '%f %f');

[sizeX1, sizeX2] = size(X);
[sizeY1, sizeY2] = size(Y);

MainData = [X, Y];

for i = 1:k,

randomNumber = round(rand(1)*sizeX1); %randdsample
Cx(i) = X(randomNumber);
Cy(i) = Y(randomNumber);
end
% random centroids initialized.

Cx = transpose(Cx);
Cy = transpose(Cy);
CCentroid = [Cx, Cy];

%for looping = 1:100,

sizeK = zeros(k, 1);
LeastSquareVal = 0;

for index=1:sizeOfKLoop,
    sizeK = zeros(k, 1);
for j = 1:sizeX1,
for i = 1:k,
X1 = [X(j),Y(j);Cx(i),Cy(i)];
d(i) = pdist(X1,'euclidean'); %distance between a point and the centroid.
end
d = transpose(d);
[minval,ind] = min(d(:)); %the index of the kth dist which is the minimum is found.

z(j) = ind;

sizeK(ind) = sizeK(ind) + 1;
end


Xsum = zeros(k, 1);
Ysum = zeros(k, 1);
for i = 1:sizeX1,
    Xsum(z(i)) = Xsum(z(i)) + X(i);
    Ysum(z(i)) = Ysum(z(i)) + Y(i);
end

for i = 1:k,
    Cx(i) = Xsum(i)/sizeK(i);
    Cy(i) = Ysum(i)/sizeK(i);
end

CCentroid = [Cx, Cy];

%disp('updated centroids:')
%Cx
%Cy

z = z';
Sm = 0;

for i = 1:sizeX1,
    Sm = Sm + norm((MainData(i,:) - CCentroid(z(i),:)),2)^2;
end

LeastSquareVal = LeastSquareVal + Sm;
Temp = LeastSquareVal;




z = z';
Sm = 0;

for i = 1:sizeX1,
    Sm = Sm + norm((MainData(i,:) - CCentroid(z(i),:)),2)^2;
end

LeastSquareVal = LeastSquareVal + Sm;
Temp = LeastSquareVal;

end



disp('final centroids for each cluster as per kemeans:')
Cx
Cy


% Maindata has the main values
% z has the assign


covarMat = cell(k,1);
for j = 1:k,
    covarMat{j} = zeros(2,2);
end


for i = 1:k,
    Kindex = find(z == i)';
    tempDataForCovarFind = MainData(Kindex,:);
    covarMat{i} = cov(tempDataForCovarFind);
end

%KindexSize = zeros(k,1);

for i = 1:k,
    Kindex = find(z == i)';
    KindexSize = size(Kindex);
    MixCoeff(i) = KindexSize(2)/sizeX1;
end


for i = 1:k,
Xmean(i) = Cx(i);
Ymean(i) = Cy(i);
end
% random centroids initialized.

Xmean = transpose(Xmean);
Ymean = transpose(Ymean);
MeanMat = [Xmean, Ymean];   % initial mean matrix with mean for each of the cluster initialized.

I = 0;
TEMP_VAL = 10000000000000000000000;
% iter = 1000000000000000;
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
LogLikeValFinal = 0;

Xindex = zeros(sizeX1,1);
tempVal = 0;

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
end
plot(LogLikeValArray)
