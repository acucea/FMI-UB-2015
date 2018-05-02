clear all

############# ex2

f=inline('sin(x)','x');
ns = [2,4,10];
x0 = -pi/2;
xf = pi/2;

for i = 1:3
   
   X = linspace(x0, xf, (ns(i) + 1));
   Y = f(X);
    
end

x = linspace(x0, xf, 100);


for i = 1:length(x)
   
   S(i) = SplineL(X,Y,x(i));
    
end

figure(1)
hold on
plot(x,S,'k','Linewidth',3);%Reprezentarea grafica a functiei S
xlabel('x')
ylabel('y')
grid on
plot(x,f(x),'--r','Linewidth',3);
plot(X,f(X),'o','MarkerFaceColor','g','MarkerSize',10)
legend('S(x) - spline liniara','f(x)=sin(x)','noduri de interpolare','Location','southeast')


######################ex 3
f=inline('sin(x)','x');
ns = [2,4,10];
x0 = -pi/2;
xf = pi/2;

fpa = cos(x0)
fpb = cos(xf)

for i = 1:3
   
   X = linspace(x0, xf, (ns(i) + 1));
   Y = f(X);
    
end

x = linspace(x0, xf, 100);


for i = 1:length(x)
   
   S(i) = SplineP(X,Y,fpa,x(i));
    
end

figure(2)
hold on
plot(x,S,'k','Linewidth',3);%Reprezentarea grafica a functiei S
xlabel('x')
ylabel('y')
grid on
plot(x,f(x),'--r','Linewidth',3);
plot(X,f(X),'o','MarkerFaceColor','g','MarkerSize',10)
legend('S(x) - spline liniara','f(x)=sin(x)','noduri de interpolare','Location','southeast')


Sp = diff(S)./diff(x);

%diff calculeaza diferente intre doua elemente consecutive
%daca x = [x1 x2 ... xn], atunci diff(x) = [x2-x1 x3-x2 ... xn-xn-1]
%dimensiunea vectorului diff(x) este n-1
hold on
figure(3)
plot(x(1:length(x)-1),Sp,'k','Linewidth',3)
df = diff(f(x))./diff(x); %Derivata functiei f calculata numeric cu functia diff
hold on
plot(x(1:length(x)-1),df,'--r','Linewidth',3)
grid on
legend('derivata funciei S','derivata functiei f','Location','southeast')
xlabel('x')
ylabel('y')

####################### ex 4

f=inline('sin(x)','x');
ns = [2,4,10];
x0 = -pi/2;
xf = pi/2;

fpa = cos(x0)
fpb = cos(xf)

for i = 1:3
   
   X = linspace(x0, xf, (ns(i) + 1));
   Y = f(X);
    
end

x = linspace(x0, xf, 100);



for i = 1:length(x)
   
   S(i) = SplineC(X,Y,fpa,fpb,x(i));
    
end

figure(4)
hold on
plot(x,S,'k','Linewidth',3);%Reprezentarea grafica a functiei S
xlabel('x')
ylabel('y')
grid on
plot(x,f(x),'--r','Linewidth',3);
plot(X,f(X),'o','MarkerFaceColor','g','MarkerSize',10)
legend('S(x) - spline liniara','f(x)=sin(x)','noduri de interpolare','Location','southeast')


Sp = diff(S)./diff(x);

%diff calculeaza diferente intre doua elemente consecutive
%daca x = [x1 x2 ... xn], atunci diff(x) = [x2-x1 x3-x2 ... xn-xn-1]
%dimensiunea vectorului diff(x) este n-1
hold on
figure(5)
plot(x(1:length(x)-1),Sp,'k','Linewidth',3)
df = diff(f(x))./diff(x); %Derivata functiei f calculata numeric cu functia diff
hold on
plot(x(1:length(x)-1),df,'--r','Linewidth',3)
grid on
legend('derivata funciei S','derivata functiei f','Location','southeast')
xlabel('x')
ylabel('y')

% Derivata de ordinul II a functiei S calculata numeric
Ss = diff(Sp)./diff(x(1:length(x)-1));
hold on

figure(6)
plot(x(1:length(x)-2), Ss,'k','Linewidth',3)%Derivata de ordinul II a functiei f calculata
%numeric
d2f = diff(df)./diff(x(1:length(x)-1));
hold on
plot(x(1:length(x)-2), d2f,'--r','Linewidth',3)
grid on
legend('derivata de ord. II a functiei S','derivata de ord. II a functiei f')
xlabel('x')
ylabel('y')
