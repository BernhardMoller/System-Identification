clear all ;close all;  clc
% 4a just generate noise free data and look at it 
nData=1000; 
variance=0; 

[x,y] = twoDimData2(nData,variance);



[xq,yq] = meshgrid(0:.2:10, 0:.2:10);
vq = griddata(x(:,1),x(:,2),y,xq,yq);
mesh(xq,yq,vq);
hold on
plot3(x(:,1),x(:,2),y,'o');
%% 4b generate 100 data with variance= 1 and a test case data with variance 0 
clc ; close all 
% generate training and test data
nData=1000; 
variance=1; 
degree=1; 
[xTrain,yTrain] = twoDimData2(nData,variance);
xtructuredTrain=Xstructor(xTrain,degree);


variance=0;
[xTest,yTest] = twoDimData2(nData,variance);
% xtructuredTest=Xstructor(xTest,degree);



% generate linear model for from the training data 
lamb=0;

m = linRegressRegul(xtructuredTrain,yTrain,lamb); 
% evaluate model on the test data 
yHat=evalModel(m,xTest);
error=mse(yTest,yHat);
% plot results 
figure() 
[xq,yq] = meshgrid(0:.2:10, 0:.2:10);
vq = griddata(xTest(:,1),xTest(:,2),yTest,xq,yq);
mesh(xq,yq,vq);
hold on
plot3(xTest(:,1),xTest(:,2),yHat,'xk');
xlabel('Dim 1 x')
ylabel('Dim 2 x')
zlabel('y')

%% 4c, testing polynomial mocels of degree 2 & 5 
% generate training and test data
clc; close all 
% nData=1000; 
% variance=1; 
% [xTrain,yTrain] = twoDimData2(nData,variance);
% variance=0;
% [xTest,yTest] = twoDimData2(nData,variance);

% creating two diffrent models of diffrent degrees 
degree1=2;
degree2=5; 
lambda1=0;
lambda2=0; 

p1=polyfit(xTrain,yTrain,lambda1,degree1);
p2=polyfit(xTrain,yTrain,lambda2,degree2);

% evaluate models 
p1Hat=evalModel(p1,xTest);
p2Hat=evalModel(p2,xTest);

% calculate error for both models 
errorMod1=mse(yTest,p1Hat);
eoormod2=mse(yTest,p2Hat);

% plot results 
% first model degree =2 
figure() 
[xq,yq] = meshgrid(0:.2:10, 0:.2:10);
vq = griddata(xTest(:,1),xTest(:,2),yTest,xq,yq);
mesh(xq,yq,vq);
hold on
plot3(xTest(:,1),xTest(:,2),p1Hat,'xk');
xlabel('Dim 1 x')
ylabel('Dim 2 x')
zlabel('y')

% second model degree = 5 
figure() 
[xq,yq] = meshgrid(0:.2:10, 0:.2:10);
vq = griddata(xTest(:,1),xTest(:,2),yTest,xq,yq);
mesh(xq,yq,vq);
hold on
plot3(xTest(:,1),xTest(:,2),p2Hat,'xk');
xlabel('Dim 1 x')
ylabel('Dim 2 x')
zlabel('y')

%% testing KNN models on same data as poly case 
clc
nData=1000; 
variance=1; 

[xTrain,yTrain] = twoDimData2(nData,variance);
variance=0; 
[xTest,yTest] = twoDimData2(nData,variance);

nSim=50; 
neighbours=1;
yHat=[];
minError=[];
for i = 1:nSim
    
    models(i)= knnRegress(xTrain, yTrain, neighbours ); 
    
    yHat(:,i)=evalModel(models(i),xTest);
    
    minError(i)=mse(yTest,yHat(:,i));
    
    neighbours=neighbours+10; 
    
end

[~, index]= sort(minError);

k=models(index(1));
kHat=yHat(:,index(1));

figure() 
[xq,yq] = meshgrid(0:.2:10, 0:.2:10);
vq = griddata(xTest(:,1),xTest(:,2),yTest,xq,yq);
mesh(xq,yq,vq);
hold on

plot3(xTest(:,1),xTest(:,2),kHat,'xk');
xlabel('Dim 1 x')
ylabel('Dim 2 x')
zlabel('y')
