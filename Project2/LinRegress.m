function m=LinRegress(x,y)
% Write a function which computes the least squares estimate given two matrices x and y.
% x is a regressor matrix with one row for each sample and y contains the output values one
% row for each sample

% m.theta=parameters
% m.variance= param uncertanties 

% To be able to build a linear model this function need to be fed an X that
% have gone through the xStructor function. otherwise X will be missing
% rows for the regressors. 

[rowX, colX]=size(x); % get dimensions of regressor and sys output. 
[~, colY]= size(y);

sampX=rowX; % nr of sampels in x & y 



% model name/ type 
m.Model= 'LR' ; 
% LS estimate
m.Theta = (x\ y ); 
% model data 


%model variance 
if 1 < colY 
    m.variance= 'None';
else 
    invXX= inv(x'*x);
    
    estError= y- x*m.Theta ; 
    
    estErrorSquare= estError'*estError; 
    
    m.Variance= estErrorSquare*(invXX / (sampX- colX)) ;  
end 

m.n=1; 
m.x=x; 
end 