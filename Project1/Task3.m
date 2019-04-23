%% Task 3.1a generating data 
clear all; close all ;clc
variance=1;
% n = 10
nData=10;
[x10,y10] = linearData(nData,variance);
[x10Test,y10Test] = linearData(nData,variance);

% n=100
nData=100;
[x100,y100] = linearData(nData,variance);
[x100Test,y100Test] = linearData(nData,variance);

% n= 1000
nData=1000;
[x1000,y1000] = linearData(nData,variance);
[x1000Test,y1000Test] = linearData(nData,variance);


%% making linear regressions for the generated data
% linear regerssion on nData=10 
lambda=0; 
x210=Xstructor(x10,1);
m10=linRegressRegul(x210,y10,lambda)
%validation
plotModelTmp(x10Test,y10Test,m10)

% linear regress on nData= 100
lambda=0; 
x2100=Xstructor(x100,1);
m100=linRegressRegul(x2100,y100,lambda)
%Validation
plotModelTmp(x100Test,y100Test,m100)

% lin regress nData = 1000 
lambda=0; 
x21000=Xstructor(x1000,1);
m1000=linRegressRegul(x21000,y1000,lambda)
%Validation 
plotModelTmp(x1000Test,y1000Test,m1000)
% done with this task, plots returned as expected 
%% 3.1 b same data as in 3a but estimate model with 5:th degrre polynomial 
clc
close all

% with nData=10
lambda=0; 
degree=5;
p10=polyfit(x10,y10,lambda,degree);


% with nData=100
lambda=0; 
degree=3;
p100=polyfit(x100,y100,lambda,degree);

p100Hat=evalModel(p100,x100);


% with nData= 1000 
lambda=0; 
degree=5;
p1000=polyfit(x1000,y1000,lambda,degree);

plotModelTmp(x10Test,y10Test,p10)
plotModelTmp(x100Test,y100Test,p100)
plotModelTmp(x1000Test,y1000Test,p1000)

% tror ev att det kan vara rätt, behöver få det kontrollerat 

%% 3.1 c monte carlo simmulation of theta 
close all
clc
nDataMonte= 10; 
variance=1;
lambda=0; 
nSim=100000; 
histbins=50;
theta2=[]; 
theta1=[];
var1=[];
var2=[]; 
for i=1:nSim
    [xMonte,yMonte] = linearData(nDataMonte,variance);
    x2Monte=Xstructor(xMonte,1); 
    mMonte=linRegressRegul(x2Monte,yMonte,lambda); 
    theta1(i)=mMonte.Theta(1);
    theta2(i)=mMonte.Theta(2);
    var1(i)=mMonte.Variance(1,1);
    var2(i)=mMonte.Variance(2,2);
       
end

% results: 
theta1var=var(theta1)
medvar1=sum(var1)/nSim

thetavar2=var(theta2)
medvar2=sum(var2)/nSim

figure()
histTheta1 = histogram(theta1,histbins);

title('interceptor,theta1')
xlabel('Value interceptor, theta2')
ylabel('Number of occurrences ')

figure()
histTheta2 = histogram(theta2,histbins);
title('"linear term",theta2');
xlabel('Value model slope, theta1')
ylabel('Number of occurrences ')
% tror det är fixat, resultaten är mycket nära varandra i alla fall 

%% 3.1 d trying KNN on the same data 
close all; clc 
% case 10 data points 
neighbours=2;
k10=knnRegress(x10,y10,neighbours);
plotModelTmp(x10Test,y10Test,k10)

% case 100 data points 
neighbours=20;
k100=knnRegress(x100,y100,neighbours);
plotModelTmp(x100Test,y100Test,k100)

% case 1000 data points
neighbours=200;
k1000=knnRegress(x1000,y1000,neighbours);
plotModelTmp(x1000Test,y1000Test,k1000)

% when using 20% of the data population as neighbours we manage to get
% quite nice results. 
%% 3.2 a generating data 
close all
clc
variance=1;
nData=10;
[xPoly10,yPoly10] = polyData(nData,variance);
[xPoly10Test,yPoly10Test] = polyData(nData,variance);

% n=100
nData=100;
[xPoly100,yPoly100] = polyData(nData,variance);
[xPoly100Test,yPoly100Test] = polyData(nData,variance);

% n= 1000
nData=1000;
[xPoly1000,yPoly1000] = polyData(nData,variance);
[xPoly1000Test,yPoly1000Test] = polyData(nData,variance);

%% 3.2 a linear regerssion 

lambda=0; 
x2Poly10=Xstructor(xPoly10,1); 
mPoly10=linRegressRegul(x2Poly10,yPoly10,lambda)
plotModelTmp(xPoly10Test,yPoly10Test,mPoly10)

% linear regress on nData= 100
lambda=0; 
x2Poly100=Xstructor(xPoly100,1); 
mPoly100=linRegressRegul(x2Poly100,yPoly100,lambda)
plotModelTmp(xPoly100Test,yPoly100Test,mPoly100)

% lin regress nData = 1000 
lambda=0; 
x2Poly1000=Xstructor(xPoly1000,1); 
mPoly1000=linRegressRegul(x2Poly1000,yPoly1000,lambda)
plotModelTmp(xPoly1000Test,yPoly1000Test,mPoly1000)

% done seems correct 
%% 3.2 b poly models of high degree on low number of datapoints, generating data 
close all
nData=15;
variance= 1;
[xPoly15,yPoly15] = polyData(nData,variance);
nData=50;
[xPoly15Test,yPoly15Test] = polyData(nData,variance);

%% testing diffrent poly degrees and regularization (lambda)
close all
degree=3; 
lambda=15;

for i=1:3
    models(i)=polyfit(xPoly15,yPoly15,lambda,degree); 
    degree=degree+5; 
    
end

% plot agains training data 
% figure()
% plotModelTmp(xPoly15,yPoly15,models(1),models(2),models(3))
% title(['Models tested on training data, Lambda=' num2str(lambda) ])
% % plot against test data 
figure()
plotModelTmp(xPoly15Test,yPoly15Test,models(1),models(2),models(3))
title(['Models tested on testing data, Lambda=' num2str(lambda) ])


% you can see overfitting with the polynomials of higher degree 
% fixed, done with task
%% 3.2 c generating unsymmetrical data 
close all
clc
nData=50;
variance=1; 
[xPolyUn,yPolyUn] = polyData(nData,variance,1);
[xPolyUnTest,yPolyUnTest] = polyData(nData,variance,1);

lambda=100; 
x2PolyUn=Xstructor(xPolyUn,1); 
mLinUn=linRegressRegul(x2PolyUn,yPolyUn,lambda)
plotModelTmp(xPolyUnTest,yPolyUnTest,mLinUn)
%% 3.2 d testing KNN on the same data as in 3.2 c 
close all
neighbours=2;
k1=knnRegress(xPolyUn,yPolyUn,neighbours);

neighbours=5;
k2=knnRegress(xPolyUn,yPolyUn,neighbours);

neighbours=8;
k3=knnRegress(xPolyUn,yPolyUn,neighbours);

plotModelTmp(xPolyUnTest,yPolyUnTest,k1,k2,k3)
legend('KNN, neighbours=2', 'KNN, neighbours=5', 'KNN, neighbours=8')

% done 
%% 3.3 a generating data with chirpData(N, var)
clear all
close all
clc
nData= 1000; 
variance=0.2; 
[xChirp,yChirp]=chirpData(nData, variance);
[xChirpTest,yChirpTest]=chirpData(nData, variance);
lambda=0;
yHat=[];
minError=[];
checkDegrees=50;
for i=1:checkDegrees
    
    models(i)=polyfit(xChirp,yChirp,lambda,i); 
    
    yHat(:,i)=evalModel(models(i),xChirpTest);
    
    minError(i)=mse(yChirpTest,yHat(:,i));
    
end

smallestError=min(minError)
 index=find(smallestError==minError);
 disp('The best model for the generated data is')
 bestModel=models(index)

figure()
plot([1:checkDegrees],minError, 'LineWidth', 2)
 xlabel('Degrees of freedom ( n theta)'); ylabel('Mse')
 hold on 
 scatter(index,minError(index),'LineWidth',2)
 grid minor
 
% help with this one 
%  plotModelTmp(xChirp,yChirp,bestModel)

%% 3.3 b  Is it better to have a high-degree polynomial + some regularization than having a
% lower degree polynomial without regularization?
clc
close all
nData= 50; 
variance=1; 
[xChirp,yChirp]=chirpData(nData, variance);
[xChirptest,yChirptest]=chirpData(nData, variance);


lambda=0;
m=polyfit(xChirp,yChirp,lambda,3); 
yHat=evalModel(m,xChirptest);
errorLowDegree=mse(yChirptest,yHat)

lambda=0.4;
p=polyfit(xChirp,yChirp,lambda,8); 
pHat=evalModel(p,xChirptest);
errorHighDegree=mse(yChirptest,pHat)
% yes it is better,

%% 3.3 c Try KNN models on this data set. 
clc
nData= 1000; 
variance=1; 
[xChirp,yChirp]=chirpData(nData, variance);
[xChirpTest,yChirpTest]=chirpData(nData, variance);

yHat=[];
minError=[];
checkNeighbours=300 ;
clear models
for i = 1:checkNeighbours
    
    models(i)= knnRegress(xChirp, yChirp, i ); 
    
    yHat(:,i)=evalModel(models(i),xChirpTest);
    
    minError(i)=mse(yChirpTest,yHat(:,i));
    
end

smallestError=min(minError)
 index=find(smallestError==minError);
 disp('The best model for the generated data is')
 bestModel=models(index)

figure()
plot([1:checkNeighbours],minError, 'LineWidth', 2)
 xlabel('Degrees of freedom ( n theta)'); ylabel('Mse')
 hold on 
 scatter(index,minError(index),'LineWidth',2)
 grid minor
