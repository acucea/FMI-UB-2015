%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 1 %%%
x = linspace(-5,5,50);
f = @(x) x .^ 3 - 18 * x - 10;
y = f(x)
plot(x,y,'.r')

function [xaprox] = MetSecantei(f, a, b, x0, x1, eps)

while (abs(x1 - x0) / abs(x0)) >= eps
	
xk = (x0 * f(x1) - x1 * f(x0)) / ( f(x1) - f(x0) );
if xk < a || xk > b
disp("Alegeti alte valori pentru x0, x1");
disp("xk curent");
disp(xk);
break
end
x0 = x1;
x1 = xk;
end

xaprox = xk ;

end


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

hold on

eps = 10 ^ (-3)

x1 = -4
x2 = -4.2
x3 = -4.3

fx1 = MetSecantei(f, -5, 5, x1, -3,eps)
fx2 = MetSecantei(f, -5, 5, x2, -3,eps)
fx3 = MetSecantei(f, -5, 5, x3, -3,eps)

plot (x1,fx1,'.b');
plot (x2,fx2,'.b');
plot (x2,fx3,'.b');

hold off






