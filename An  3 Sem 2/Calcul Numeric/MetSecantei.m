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