function m = linRegressRegul(x,y,lamb)

% x is a regressor matrix with one row for each sample and y contains the output values one
% row for each sample
% lamb 

% m.theta=parameters
% m.variance= param uncertanties


% QUESTION: if lambda =0 should x2 & y2 be returned as [x ; zeros] or as
% their original size, it most probably should. 

% x=[x, ones(size(x))];

if lamb==0 
    x2=x; 
    y2=y; 
else 
x2=[x ; sqrt(lamb)*eye(size(x))]; % appended x & y with lamb*their identity matrix 
y2=[y ; zeros(size(y))]; 
end 



m=LinRegress(x2,y2); 
m.Lambda=lamb;
m.Model='LR-Regul';
m.x=x;
end 