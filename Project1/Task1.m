% test file / main for project 1 

% task 1.a
clc
close all
n=50;
var=0;
[x,y]=linearData(n,var);
[xtest,ytest]=linearData(n,var);
% [p,S,mu]= polyfit(x,y,1); 



scatter(x,y,'xk')
grid on

x2=Xstructor(x,1);
m = LinRegress(x2,y);
m.Variance;


%% task 1.b Write a function evalModel
[~,index]=sort(xtest); 
yHat= evalModel(m,xtest);
close all

plot(xtest(index),yHat(index))
hold on 
scatter(xtest,ytest)
grid on 


%% task 1c , Write a function linRegressRegul
clc 
close all
[~,index]=sort(xtest); 

lambda= 0; 
x2=Xstructor(x,1);

mRegul=linRegressRegul(x2,y,lambda);

yHatRegul=evalModel(mRegul , xtest); 
% m.Variance
% tmp=find(m.y==y); % seems to work but do not know 

plot(xtest(index),yHatRegul(index))
hold on 
scatter(x,y)
grid on 


%% 1d polydata polyfit 
clc
close all
n=50;
var=0;
sym=0;

[x,y]=polyData(n,var,sym);
[xtest,ytest]=polyData(n,var,sym);


degree=4; 
lambda=0; 
m=polyfit(x,y,lambda,degree);
%
yHat=evalModel(m , xtest); 

error= mse(y,yHat);

[~,index]=sort(xtest); 

figure()
scatter(x,y)
hold on
plot(xtest(index),yHat(index),'LineWidth',2 )
grid minor

%% 1d create plotmodel  
close all
clc
%data  
n=50;
var=1;
sym=0;

[x,y]=polyData(n,var,sym);
[xTest,yTest]=polyData(n,var,sym);
%model 1 
degree=4; 
lambda=0; 
m=polyfit(x,y,lambda,degree);

%model 2
lambda=1; 
degree=2;
p=polyfit(x,y,lambda,degree);



% using plotModel 
plotModelTmp(xTest,yTest,m,p)

% plotManyModel(x,y,m,p)


%% 1d plot of single model
close all
clc

% [max, min]=modUncert(m,n,alpha)
% scatter(max,x)
% hold on 
% scatter(min,x)
plotModelTmp(x,y,m)

