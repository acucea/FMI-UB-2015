function [y] = SplineC(X,Y,fpa,fpb,x)

n = size(X)(2)-1 ;
a = zeros(size(X));
b = zeros(size(X));

for j = 1:n
   
   a(j) = Y(j);
   b(j) = (Y(j+1) - Y(j)) / (X(j+1) - X(j)) ;
    
end

S = 0;

for j = 1:n

    if x >= min([X(j),X(j+1)]) && x <= max([X(j),X(j+1)])
    
        S = a(j) + b(j) * (x-X(j));
        
    end
    
end

%y = S;

y = spline(X,Y,x);



end