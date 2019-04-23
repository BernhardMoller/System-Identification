function [yMax, yMin]= modUncert(m,n,alpha,x)



d=numel(m.Theta);
randTheta = 0.5 - rand(d, n); 
tmp=m; 

yPred=[];

for k=1:n
    colRandTheta=randTheta(:,k); 
    DeltaThetaK= colRandTheta/ norm(colRandTheta)*chi2inv(alpha,d);
    tmp.Theta = m.Theta + m.Variance^(1/2)*DeltaThetaK;
    yPred=[yPred, evalModel(tmp,x)];  
    
end 


ymax=[];
yMin=[];
for i=1:size(yPred,1)
    yMax(i)=max(yPred(i,:));
    yMin(i)=min(yPred(i,:));
end
end 