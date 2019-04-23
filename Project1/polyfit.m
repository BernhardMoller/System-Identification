function m=polyfit(x,y,lamb,degree)
% x= regressors, row vector
% y= true output, row vecor
% lamb= regularization marameter value, int/ double 
% n= deg of polynomial, will produce a 


% calculating the polynomial regressor 

x2=Xstructor(x,degree); 

% poly reg end 
% x2
% polynomial fitting start 

m=linRegressRegul(x2,y,lamb); 

if degree ==0
    if lamb==0
        m.Model= 'LR';
    else
        m.Model='LRR';
        
    end
else
    msg=['Polynomial, deg' num2str(degree)];
    m.Model=[msg];
end

m.n=degree; 
end 

