function [xaprox, N] = MetGaussSeidelR(A, a, eps, sigma1)

n = size(A);
n = n(1);

x0 = zeros(n,1);
x1 = x0;

k = 0;

if issymmetric(A)==0
    disp('Matricea nu este simetrica');
    return;
end

[~, posDef] = chol(A);

if posDef ~= 0
    disp('Matricea nu e positiv definita')
    return;
end


while 1 == 1
    sum1=0;
    sum2=0;
    
    k = k + 1;
    
    x0 = x1;
    
    for i=1:n
        
        for j=i+1:n
            sum1 = sum1 + A(i,i)*x0(j);
        end
        
        for j=1:i-1
            sum2 = sum2+A(i,i)*x1(j);
        end
        
        x1(i)=(1-sigma1)*x0(i) + (sigma1/A(i,i)) * (a(i) - sum1 - sum2);
    end
    
    % bug2 -> calculat corect norma A
    if norm(x1-x0,1) / (norm(x0,1) + 0.0001) < eps
        break; 
    end

end

xaprox = x1;
N = k;

end