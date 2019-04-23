function knm=knnRegress(x,y,n)
knm.x=x;
knm.y=y;
knm.n=n; 
knm.Model='KNN';
knm.Label=['KNN, neighbours:' num2str(n)];

end 