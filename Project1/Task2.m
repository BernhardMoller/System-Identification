%% 2 a & b knnRegress function created 
close all 
clc
var=0;
sym=0;
nData=20; 
[xk,yk]=linearData(nData,var);
var=0.3;
[xtest,ytest]=linearData(nData,var);
lamb=0; 

x2k=Xstructor(xk,1);
m=linRegressRegul(x2k,yk,lamb);

k=knnRegress(xk,yk,3);

kHat=evalModel(k,xtest);
mHat=evalModel(m,xtest);

[~, index]=sort(xtest);
figure()
plot(xtest(index),kHat(index),'LineWidth',2)
hold on 
plot(xtest(index),mHat(index),'LineWidth',2)
scatter(xtest,ytest)
legend('KNN estimate','Linear estimate','Generated data')
xlabel('x'); ylabel('y')
% done 
%% 2c changed plotModel to take KNN models.
close all
plotModelTmp(xtest,ytest,k)
% modified and seems to work correctly 
%done

