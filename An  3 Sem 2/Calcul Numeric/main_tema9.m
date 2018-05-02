a = 0;
b = pi;
n_discretizare = 100;

f = inline('sin(x)','x');
f_derivat = inline('cos(x)','x');
f_derivat2 = inline('-sin(x)','x');
ns = [4 ,6, 8];
h = 1.2;
X = linspace(a,b,n_discretizare);
Y = f_derivat(X);
Y_R = zeros(size(X));

for i = 1:length(ns)
    
    
    
    for j = 1:length(X)
        Y_R(j) = MetRichardson(f,X(j),h,ns(i),1);    
    end
    
    
    figure(i)
    hold on
    plot(X,Y,'k','Linewidth',3);%Reprezentarea grafica a functiei S
    xlabel('x')
    ylabel('y')
    grid on
    plot(X,Y_R,'--r','Linewidth',3);
    legend('Derivata','Aproximarea')
    
end


figure(4)
hold on
plot(X,Y-Y_R,'k','Linewidth',3)
grid on
xlabel('x')
ylabel('y')

legend('Eroarea')

Y = f_derivat2(X);
for i = 1:length(ns)
    
    
    
    for j = 1:length(X)
        Y_R(j) = MetRichardson(f,X(j),h,ns(i),2);    
    end
    
    
    figure(i+4)
    hold on
    plot(X,Y,'k','Linewidth',3);%Reprezentarea grafica a functiei S
    xlabel('x')
    ylabel('y')
    grid on
    plot(X,Y_R,'--r','Linewidth',3);
    legend('Derivata','Aproximarea')
    
end

%%%%%%%%%%%%% ex 4
a = 0;
b = pi;
f = inline('sin(x)','x');
m = 10;

#for i = 1:length(metoda)
for i = 1:4

    I = Integrare(f,a,b,m,i);
    I2 = quadv(f,a, b);
    disp(abs(I-I2));
    
end







