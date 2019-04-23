function predicted=idpredict(model,z,horizon) 

y=z(:,1);
u=z(:,2);

yLength=size(z,1); 

predictions=zeros(yLength,horizon); 

uTmp=zeros(yLength,model.n(2));
yTmp=zeros(yLength,model.n(1)); 

for i = 1:m.n(2)
    uTmp(i+1+model.n(3):end, i) = u(1:end-i-model.n(3));
end

for i = 1:m.n(1)
    yTmp(i+1:end, i) = -y(1:end-i);
end

switch m.model
    case 'OE'
        y_pred = idsimulate(m, z);  % prediction of OE is the same as simulation, regardless of horizon!
    case 'ARX'
        for i = 1:horizon
            X = [Y, U];
            Y_pred(:, i) = X*m.theta;
            % update the regressor matrix
            Y(2:end, 2:end) = Y(1:end-1, 1:end-1);
            Y(2:end, 1) = -Y_pred(1:end-1, i);
%             U(2:end, :) = U(1:end-1, :);
%             U(1, :) = zeros(size(U(1, :)));
        end
        y_pred = Y_pred(:, end);
    otherwise
end


end 