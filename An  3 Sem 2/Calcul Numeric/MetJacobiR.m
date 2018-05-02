function [xaprox, N] = MetJacobiR(A, a, eps, sigma1)

# step 1

n = size(A);
n = n(1);

#normaA = eye(n) - A;
#normaA = norm(normaA,1);

#if normaA >= 1 
   
#   disp(normaA);
#   disp('Metoda Jacobi nu asigura conv.')
#   break;
    
#end


x0 = zeros(n,1);
x1 = x0;

k = 0;


B = zeros(n);
b = zeros(1,n);
for i=1:n
    for j=1:n
        if i == j
            B(i,j) = 0;
        else
            # bug1 -> calculat corect B(i,j)
            B(i,j) = (-1) * sigma1 .* A(i,j);
        end
    end

    b(i) = sigma1 * a(i);
end

#B = eye(n) - A;
#b = a;

#q = normaA;
#x0 = B * x1 + b;
#x1 = x0;
#disp((transpose(A * (x0)) * (x0)))
#while ((transpose(A * (x1-x0)) * (x1-x0)) / (transpose(A * (x0)) * (x0)) ) >= eps

while 1 == 1
    k = k + 1;
    
    x0 = x1;
    x1 = B * x1 + b;
    
    # bug2 -> calculat corect norma A
    
    if norm(x1-x0,1) / (norm(x0,1) + 0.001) < eps
    
        break;
        
    end 
    
end

xaprox = x1;
N = k;

end