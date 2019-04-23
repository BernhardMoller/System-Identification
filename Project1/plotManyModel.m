function plotManyModel(varargin)
% args in should be formatted as (x,y,model 1,..., model n)

x=varargin{1};

[~,I] = sort(x);


y=varargin{2}; 
% alpha=varargin{3};
args= nargin; 

i=3;
while i<=args
    
   models(i-2) = varargin(i); 
   i=i+1; 
   
end


for k= 1:numel(models)

yHat=evalModel(models{k}, models{k}.x); 

legTxt{k}=models{k}.Model; 
% figure()
% msg=['Input model' num2str(k)];
% title(msg)
plot(x(I),yHat(I),'LineWidth',2)
hold on

end
scatter(x,y,'k')
legTxt{end+1}='True data';
legend(legTxt)
grid minor

end 
 