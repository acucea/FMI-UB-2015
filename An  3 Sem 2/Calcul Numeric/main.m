function main()
f = @(x)x .^ 3 - 7 * x .^ 2 + 14 * x - 6 ;
x = linspace(0,4,100);
y = f(x);
plot(x,y,'.r');

e = 10^(-5);
int1 = linspace(0,1,100);
int2 = linspace(1,3.2);
int3 = linspace(3.2,4);

xap1 = MetBisectie(f,0,1,e);
xap2 = MetBisectie(f,1,3.2,e);
xap3 = MetBisectie(f,3.2,4,e);

hold on

plot(xap1,f(xap1),'*b');
plot(xap2,f(xap2),'*b');
plot(xap3,f(xap3),'*b');

hold off
e = 2.71828;
f = @(x) e .^ x - 2;
f2 = @(x) cos(e .^ x - 2);

x = linspace(-10,10,50);
y1 = f(x);
y2 = f2(x);

plot(x,y1,'*r');
hold on
plot(x,y2,'.b');
hold off

e = 2.71828;
f = @(x) e.^x - 2 - cos(e.^x -2);
eps = 10 .^ (-5);
MetBisectie(f,0.5,1.5,eps)

f = @(x) x - sqrt(3);
a = 1;
b = 2;
eps = 10 .^ (-5);
MetBisectie(f,a,b,eps)

f = @(x) x .^ 3 - 7 * x .^2 + 14 * x - 6;
x = linspace(0,4,100);
y = f(x);
plot(x,y,'.r')



end