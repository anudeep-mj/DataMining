% clear, clc;
clear *

prompt = 'Please enter the k value:';
k = input(prompt)
sizeOfLoop = 50;
%k = 5;

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

LeastSquareVal= zeros(50,1);

for index=1:sizeOfLoop,
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

%figure(1)
%scatter(X,Y)
%hold on
%scatter(CCentroid(:,1),CCentroid(:,2),100,'fill')
%axis([-3 3 -3 3])
%hold off

%figure(2)
%plot(z)
%axis([0 1500 0 6])

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

LeastSquareVal(index) = LeastSquareVal(index) + Sm;
%Temp = LeastSquareVal(index);

end

LeastSquareVal = LeastSquareVal/sizeX1;

disp('final centroids for each cluster:')
Cx
Cy
plot(LeastSquareVal)
%axis([0 25 0 1700])
