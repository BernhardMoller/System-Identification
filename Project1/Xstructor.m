function x2=Xstructor(x,degree)


[numSamples, numDimensions] = size(x);

x2 = ones(numSamples,1);  % constant regressor
for p = 1:degree
    %C = unique(nchoosek(rectpulse(1:numDimensions,p),p),'rows');
    % Rectpulse not available in Octave /Emil
    C = nchoosek(repmat(1:numDimensions, 1, p), p);
    C = unique(sort(C, 2, 'ascend'), 'rows');
    for i = 1:size(C,1) % for each possible combination of order p (n>=1)
        x2 = [x2 prod(x(:,C(i,:)),2)];
    end
end


end 