label = csvread('updLabel.csv');

flipud(label);

LabelWith1s = find(ans == 1);

LabelWith2s = find(ans == 2);

LabelWith0s = find(ans == 0);

LabelWith1and0s = find(ans == 1 | ans == 0);
LabelWith1and2s = find(ans == 1 | ans == 2);
LabelWith0and2s = find(ans == 0 | ans == 2);

% load('200kMatrix.mat')

DataOfLabel1 = a(LabelWith1s,:);
DataOfLabel2 = a(LabelWith2s,:);
DataOfLabel0 = a(LabelWith0s,:);

%save DataOfLabel0 DataOfLabel0
%save DataOfLabel1 DataOfLabel1
%save DataOfLabel2 DataOfLabel2
%save DataOfLabel10 DataOfLabel10
%save DataOfLabel12 DataOfLabel12
%save DataOfLabel02 DataOfLabel02

i = 1:350;
DataOfLabel12Test = DataOfLabel12(i,:);
save DataOfLabel12Test DataOfLabel12Test
clear
load('DataOfLabel10.mat')
563/3;

ans*2;


i = 1:375;
DataOfLabel10Test = DataOfLabel10(i,:);
save DataOfLabel10Test DataOfLabel10Test
clear
load('DataOfLabel02.mat')
529/3

ans =

  176.3333

ans*2

ans =

  352.6667

i = 1: 352;
DataOfLabel02Test = DataOfLabel02(i,:);
save DataOfLabel02Test DataOfLabel02Test


i = 1:70;
DataOfLabel12TrainP1 = DataOfLabel12Train(i,:);
i = 71:140;
DataOfLabel12TrainP2 = DataOfLabel12Train(i,:);
i = 141:210;
DataOfLabel12TrainP3 = DataOfLabel12Train(i,:);
i = 211:280;
DataOfLabel12TrainP4 = DataOfLabel12Train(i,:);
i = 281:350;
DataOfLabel12TrainP5 = DataOfLabel12Train(i,:);
save DataOfLabel12TrainP1 DataOfLabel12TrainP1
save DataOfLabel12TrainP2 DataOfLabel12TrainP2
save DataOfLabel12TrainP3 DataOfLabel12TrainP3
save DataOfLabel12TrainP4 DataOfLabel12TrainP4
save DataOfLabel12TrainP5 DataOfLabel12TrainP5


i = 1:75;
DataOfLabel10TrainP1 = DataOfLabel10Train(i,:);
i = 76:150;
DataOfLabel10TrainP2 = DataOfLabel10Train(i,:);
i = 151:225;
DataOfLabel10TrainP3 = DataOfLabel10Train(i,:);
i = 226:300;
DataOfLabel10TrainP4 = DataOfLabel10Train(i,:);
i = 301:375;
DataOfLabel10TrainP5 = DataOfLabel10Train(i,:);
save DataOfLabel10TrainP1 DataOfLabel10TrainP1
save DataOfLabel10TrainP2 DataOfLabel10TrainP2
save DataOfLabel10TrainP3 DataOfLabel10TrainP3
save DataOfLabel10TrainP4 DataOfLabel10TrainP4
save DataOfLabel10TrainP5 DataOfLabel10TrainP5



i = 1:70;
DataOfLabel02TrainP1 = DataOfLabel02Train(i,:);
i = 71:140;
DataOfLabel02TrainP2 = DataOfLabel02Train(i,:);
i = 141:210;
DataOfLabel02TrainP3 = DataOfLabel02Train(i,:);
i = 211:280;
DataOfLabel02TrainP4 = DataOfLabel02Train(i,:);
i = 281:350;
DataOfLabel02TrainP5 = DataOfLabel02Train(i,:);
save DataOfLabel02TrainP1 DataOfLabel02TrainP1
save DataOfLabel02TrainP2 DataOfLabel02TrainP2
save DataOfLabel02TrainP3 DataOfLabel02TrainP3
save DataOfLabel02TrainP4 DataOfLabel02TrainP4
save DataOfLabel02TrainP5 DataOfLabel02TrainP5


label = csvread('updLabel.csv');
flipud(label);
1sand0s = find(ans == 1 | ans == 0);
label1sand0s = find(ans == 1 | ans == 0);
ans(label1sand0s)
LabelOfData10 = ans;
invertedLabel = flipud(label);
LabelWith0and2 = find(invertedLabel == 0 | invertedLabel == 2);
LabelOfData02 = invertedLabel(LabelWith0and2);
LabelWith1and2 = find(invertedLabel == 1 | invertedLabel == 2);
LabelOfData12 = invertedLabel(LabelWith1and2);
save LabelOfData12 LabelOfData12
save LabelOfData10 LabelOfData10
save LabelOfData02 LabelOfData02
LabelOfData12




label = csvread('updLabel.csv');

flipped = flipud(label);

LabelWith1s = find(flipped == 1);

LabelWith2s = find(flipped == 2);

LabelWith0s = find(flipped == 0);
i = 1:186;
Temp1 = LabelWith1s(i,:);
Temp2 = LabelWith0s(i,:);
Temp = vertcat(Temp1,Temp2);
Temp = sort(Temp);
Label01TrainP1 = flipped(Temp);
save Label01TrainP1 Label01TrainP1
Data01TrainP1 = a(Temp,:);
save Data01TrainP1 Data01TrainP1

i = 189:283;
j = 187:280;
Temp1 = LabelWith0s(i,:);
Temp2 = LabelWith1s(j,:);
Temp = vertcat(Temp1,Temp2);
Temp = sort(Temp);
Label01TestP1 = flipped(Temp);
save Label01TestP1 Label01TestP1
Data01TestP1 = a(Temp,:);
save Data01TestP1 Data01TestP1



label = csvread('updLabel.csv');

flipped = flipud(label);

LabelWith1s = find(flipped == 1);

LabelWith2s = find(flipped == 2);

LabelWith0s = find(flipped == 0);
load('200kMatrix.mat')
i = 95:280;
Temp1 = LabelWith1s(i,:);
Temp2 = LabelWith0s(i,:);
Temp = vertcat(Temp1,Temp2);
Temp = sort(Temp);
Label01TrainP2 = flipped(Temp);
save Label01TrainP2 Label01TrainP2
Data01TrainP2 = a(Temp,:);
save Data01TrainP2 Data01TrainP2

i = 1:94;
j = 1:94;
Temp1 = LabelWith0s(i,:);
Temp2 = LabelWith1s(j,:);
Temp = vertcat(Temp1,Temp2);
Temp = sort(Temp);
Label01TestP2 = flipped(Temp);
save Label01TestP2 Label01TestP2
Data01TestP2 = a(Temp,:);
save Data01TestP2 Data01TestP2



label = csvread('updLabel.csv');

flipped = flipud(label);

LabelWith1s = find(flipped == 1);

LabelWith2s = find(flipped == 2);

LabelWith0s = find(flipped == 0);
i = 1:94;
itemp = 189:280;
i = horzcat(i,itemp);
Temp1 = LabelWith1s(i,:);
Temp2 = LabelWith0s(i,:);
Temp = vertcat(Temp1,Temp2);
Temp = sort(Temp);
Label01TrainP3 = flipped(Temp);
save Label01TrainP3 Label01TrainP3
Data01TrainP3 = a(Temp,:);
save Data01TrainP3 Data01TrainP3


i = 95:188;
j = 95:188;
Temp1 = LabelWith0s(i,:);
Temp2 = LabelWith1s(j,:);
Temp = vertcat(Temp1,Temp2);
Temp = sort(Temp);
Label01TestP3 = flipped(Temp);
save Label01TestP3 Label01TestP3
Data01TestP3 = a(Temp,:);
save Data01TestP3 Data01TestP3



label = csvread('updLabel.csv');

flipped = flipud(label);

LabelWith1s = find(flipped == 1);

LabelWith2s = find(flipped == 2);

LabelWith0s = find(flipped == 0);
load('200kMatrix.mat')
i = 1:164;
Temp1 = LabelWith1s(i,:);
Temp2 = LabelWith2s(i,:);
Temp = vertcat(Temp1,Temp2);
Temp = sort(Temp);
Label12TrainP1 = flipped(Temp);
save Label12TrainP1 Label12TrainP1
Data12TrainP1 = a(Temp,:);
save Data12TrainP1 Data12TrainP1
i = 165:280;
j = 165:246;
Temp1 = LabelWith0s(i,:);
Temp2 = LabelWith1s(j,:);
Temp = vertcat(Temp1,Temp2);
Temp = sort(Temp);
Label12TestP1 = flipped(Temp);
save Label12TestP1 Label12TestP1
Data12TestP1 = a(Temp,:);
save Data12TestP1 Data12TestP1




label = csvread('updLabel.csv');

flipped = flipud(label);

LabelWith1s = find(flipped == 1);

LabelWith2s = find(flipped == 2);

LabelWith0s = find(flipped == 0);
load('200kMatrix.mat')
i = 83:246;
Temp1 = LabelWith1s(i,:);
Temp2 = LabelWith2s(i,:);
Temp = vertcat(Temp1,Temp2);
Temp = sort(Temp);
Label12TrainP2 = flipped(Temp);
save Label12TrainP2 Label12TrainP2
Data12TrainP2 = a(Temp,:);
save Data12TrainP2 Data12TrainP2
i = 246:280;
j = 1:82;
Temp1 = LabelWith1s(j,:);
Temp3 = LabelWith1s(i,:);
Temp2 = LabelWith2s(j,:);
Temp = vertcat(Temp1,Temp2,Temp3);
Temp = sort(Temp);
Label12TestP2 = flipped(Temp);
save Label12TestP2 Label12TestP2
Data12TestP2 = a(Temp,:);
save Data12TestP2 Data12TestP2





label = csvread('updLabel.csv');

flipped = flipud(label);

LabelWith1s = find(flipped == 1);

LabelWith2s = find(flipped == 2);

LabelWith0s = find(flipped == 0);
i = 1:82;
itemp = 165:246;
i = horzcat(i,itemp);
Temp1 = LabelWith1s(i,:);
Temp2 = LabelWith2s(i,:);
Temp = vertcat(Temp1,Temp2);
Temp = sort(Temp);
Label12TrainP3 = flipped(Temp);
save Label12TrainP3 Label12TrainP3
Data12TrainP3 = a(Temp,:);
save Data12TrainP3 Data12TrainP3

i = 83:164;
j = 246:280;
Temp1 = LabelWith1s(i,:);
Temp2 = LabelWith1s(j,:);
Temp3 = LabelWith2s(i,:);
Temp = vertcat(Temp1,Temp2,Temp3);
Temp = sort(Temp);
Label12TestP3 = flipped(Temp);
save Label12TestP3 Label12TestP3
load('200kMatrix.mat')
Data12TestP3 = a(Temp,:);
save Data12TestP3 Data12TestP3



label = csvread('updLabel.csv');

flipped = flipud(label);

LabelWith1s = find(flipped == 1);

LabelWith2s = find(flipped == 2);

LabelWith0s = find(flipped == 0);
load('200kMatrix.mat')


i = 1:164;
Temp1 = LabelWith0s(i,:);
Temp2 = LabelWith2s(i,:);
Temp = vertcat(Temp1,Temp2);
Temp = sort(Temp);
Label02TrainP1 = flipped(Temp);
save Label02TrainP1 Label02TrainP1
Data02TrainP1 = a(Temp,:);
save Data02TrainP1 Data02TrainP1

i = 165:283;
j = 165:246;
Temp1 = LabelWith0s(i,:);
Temp2 = LabelWith2s(j,:);
Temp = vertcat(Temp1,Temp2);
Temp = sort(Temp);
Label02TestP1 = flipped(Temp);
save Label02TestP1 Label02TestP1
Data02TestP1 = a(Temp,:);
save Data02TestP1 Data02TestP1




label = csvread('updLabel.csv');

flipped = flipud(label);

LabelWith1s = find(flipped == 1);

LabelWith2s = find(flipped == 2);

LabelWith0s = find(flipped == 0);
load('200kMatrix.mat')
i = 83:246;
Temp1 = LabelWith0s(i,:);
Temp2 = LabelWith2s(i,:);
Temp = vertcat(Temp1,Temp2);
Temp = sort(Temp);
Label02TrainP2 = flipped(Temp);
Label02TrainP3 = Label02TrainP2;
save Label02TrainP2 Label02TrainP2
Data02TrainP2 = a(Temp,:);
save Data02TrainP2 Data02TrainP2

i = 246:283;
j = 1:82;
Temp1 = LabelWith0s(j,:);
Temp3 = LabelWith0s(i,:);
Temp2 = LabelWith2s(j,:);
Temp = vertcat(Temp1,Temp2,Temp3);
Temp = sort(Temp);
Label02TestP2 = flipped(Temp);
save Label02TestP2 Label02TestP2
Data02TestP2 = a(Temp);
save Data02TestP2 Data02TestP2




label = csvread('updLabel.csv');

flipped = flipud(label);

LabelWith1s = find(flipped == 1);

LabelWith2s = find(flipped == 2);

LabelWith0s = find(flipped == 0);
i = 1:82;
itemp = 165:246;
i = horzcat(i,itemp);
Temp1 = LabelWith0s(i,:);
Temp2 = LabelWith2s(i,:);
Temp = vertcat(Temp1,Temp2);
Temp = sort(Temp);
Label02TrainP3 = flipped(Temp);
save Label02TrainP3 Label02TrainP3
 
load('200kMatrix.mat')
Data02TrainP3 = a(Temp,:);
save Data02TrainP3 Data02TrainP3

i = 83:164;
j = 246:283;
Temp1 = LabelWith0s(i,:);
Temp2 = LabelWith0s(j,:);
Temp3 = LabelWith2s(i,:);
Temp = vertcat(Temp1,Temp2,Temp3);
Temp = sort(Temp);
Label02TestP3 = flipped(Temp);
save Label02TestP3 Label02TestP3
Data02TestP3 = a(Temp,:);
