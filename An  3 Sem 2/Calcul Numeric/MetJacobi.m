function [xaprox, N] = MetJacobi(A,a,eps)

# step 1

n = size(A);
n = n(1);

normaA = eye(n) - A;
normaA = norm(normaA,1);

if normaA >= 1 
   
   disp(normaA);
   disp('Metoda Jacobi nu asigura conv.')
   break;
    
end


x0 = zeros(n,1);
x1 = x0;
xk = x0;

k = 0;

B = eye(n) - A;
b = a;

q = normaA;

while 1 == 1
   
    k = k + 1;
    
    if k == 1 
    
        x1 = B * x0 + b;
        xk = x1;
        
    else
        
        xk = B * xk + b;
    
    
    if (q.^k / (1 - q)) .* norm(x1-x0,1) < eps
    
    break;
       
    end
    
end

xaprox = xk;
N = k;

end