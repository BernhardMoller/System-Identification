function [x,y]=ARXstructor(z,n)

na=n(1);
nb=n(2);
nk=n(3) ;

[nZ, ~] = size(z);

XU = zeros(nZ+nb-1+nk, nb);

for i = 1:nb
    
    XU(i+nk+1:i+nk+nZ, i) = z(:, 2);
end
XU = XU(1:nZ,:);

XY = zeros(nZ+na, na);
for i = 1:na
    XY(i+1:i+nZ, i) = z(:, 1);
end
XY = XY(1:nZ,:);

x = [-XY, XU];
y = z(:, 1);


end 