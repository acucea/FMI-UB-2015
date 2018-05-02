function [xaprox, N] = MetJacobiDDL(A, a, eps)

size_a = size(a);
n = size_a(2);

%pas 1
for i=1:n
    sum = 0;

    for j=1:n
        if(i ~= j)
            sum = sum+A(i,j);
        end
    end

    if abs(A(i,i)) <= abs(sum)
        disp('Matricea nu este diag. dom. pe linii')
        return;
    end
end

%pas 2

x0 = zeros(n,1);
x1 = x0;
xk = x0;

k = 0;

%pas 3

B = zeros(n);
b = zeros(n,1);
for i=1:n
    for j=1:n
        if i == j
            B(i,j) = 0;
        else
            B(i,j) = -A(i,j)/A(i,i);
        end
    end

    b(i) = a(i)/A(i,i);
end
q = norm(B, Inf);

%pas 4


while 1 == 1
    k = k + 1;
    if k == 1
        x1 = B * x0 + b;
        xk = x1;
    else
        xk = B * xk + b;

        if (q.^k / (1 - q)) * norm(x1-x0,Inf) < eps
            break;
        end
    end
end

xaprox = xk;
N = k;

end