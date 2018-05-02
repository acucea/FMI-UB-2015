function [xaprox] = metoda_pozitiei_false(f, a, b, eps)

k = 0;
x0 = ( a * f(b) - b * f(a) ) / (f (b) - f (a));
xk = x0;

cond = 1;

while cond == 1
if f(xk) == 0
break;
else if f(a) * f(xk) < 0
b = xk;
x0 = xk;
xk = ( a * f(b) - b * f(a) ) / (f (b) - f (a));
elseif f(a) * f(xk) > 0
a = xk;
x0 = xk;
xk = ( a * f(b) - b * f(a) ) / (f (b) - f (a));
end

if abs(xk - x0) / abs(x0) < eps
    cond = 0;
end

    
end

xaprox = xk;

end