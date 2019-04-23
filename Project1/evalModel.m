function yHat=evalModel(m,x)

% input:  m= regressor model
%         x= regressor matrix 
% output: yHat = predicted values 

% if ~(isfield(m,'x') || isfield(m,'theta') )
%     msg='field x or theta in m is missing';
%     error(msg); 
% end
 


switch m.Model
    case 'KNN'
        % Given an input regressor x find the n closest regressor in the 
        % KNN model. 
        % issue with KNN in multi dimensions, all dimensions are stacked
        % ontop of eachother in Xcol and MXcol causing a issue at yHat
        % calculation with indexing
        
        
            d = pdist2(x, m.x);
            [~, Index] = sort(d, 2);
            yHat = mean(m.y(Index(:,1:m.n)), 2);
            
%             
%         end
        
        % Form the mean of the outputs associated with the n closest 
        % regressor in the KNN model and deliver this mean value as the 
        % model estimate.
        
%         yHat = mean(sortedDistances(1,m.n));
        
    
    otherwise

        degree=m.n;
        x2=Xstructor(x,degree);
      
        
        yHat=x2*m.Theta; 
end
end 