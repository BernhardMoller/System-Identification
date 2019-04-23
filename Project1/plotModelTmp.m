function plotModelTmp(varargin)
%Plot data together with the estimated function

% input: generated data, regressors, model, estimated model, 
% model1,model2,model3 can be multiple, e.g.,

% extract regressors
x = varargin{1};
% extract generated data
y = varargin{2};
[~, numDimensionsY] = size(y);
[~,I] = sort(x);

if nargin==3 % case with only one model, include uncertanty in plort
   
m = varargin{3};
    
    % makes the plot if the data is one dimensional 
    if numDimensionsY == 1
        
        switch m.Model
            case 'KNN'
                yHat = evalModel(m,x); 

                figure(); hold on
                plot(x,y,'o','Markersize',8);
                plot(x(I),yHat(I),'LineWidth',2)
                xlabel('x'); ylabel('y')
                legend('True data', m.Model )
            
            otherwise 
                alpha = 0.95;
                n = 100;
                [f_min, f_max] = modUncert(m,n,alpha,x);
                yHat = evalModel(m,x);
                figure; 
                plot(x,y,'o','Markersize',8);
                hold on
                plot(x(I),yHat(I),'LineWidth',2)
                plot(x(I),f_min(I),'--','LineWidth',2);
                plot(x(I),f_max(I),'--','LineWidth',2); 
                xlabel('x'); ylabel('y')
                legend('True data',m.Model, ...
                'Approximate upper bound', 'Approximate lower bound')
        end
    end
else  % case with more than one model as input, plotting all models togeather with true data 
        % do not think any modding of the multi model case is nessesary, all
        % changes that need to get done is fixed in evalModel 
         args= nargin;
        i=3;
        while i<=args

           models(i-2) = varargin(i); 
           i=i+1; 

        end

        for k= 1:numel(models)

            tmpModel=models{k};

            yHat=evalModel(tmpModel,x);
        %     ysize=size(yHat)
        %     xsize=size(x)
        %     isize=size(I)
            plot(x(I),yHat(I),'LineWidth',2)
%             plot(x,yHat,'LineWidth',2)
     
            hold on
            legTxt{k}=tmpModel.Model;

        end
    
        scatter(x,y)
        grid minor
        xlabel('x'); ylabel('y')
        legTxt{end+1}='True Data';
        legend(legTxt);
end


end

 