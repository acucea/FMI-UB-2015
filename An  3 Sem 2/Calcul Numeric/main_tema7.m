f=inline('sin(x)','x');
x0=-pi/2; xf=pi/2; N=3;
X=linspace(x0,xf,(N+1)); %Nodurile de interpolare echidistante
Y=f(X); %Valorile lui f in nodurile de interpolare
x=linspace(x0,xf,100);% Diviziunea in baza careia se construiesc graficele
%Vectorul PN reprezinta valorile polinomului Lagrange, construit conform
%meodei Newton DD, in fiecare nod al discretizarii intervalului [-1,1] cu
%100 de noduri
for ind=1:length(x)
    
   random_no = round(3 * rand(1,1));
   if random_no == 0 
        PN(ind)=MetNDD(X,Y,x(ind));
   elseif random_no == 1 
        PN(ind)=MetNewton(X,Y,x(ind));
   elseif random_no == 2
        PN(ind)=MetDirecta(X,Y,x(ind));
   elseif random_no == 3
        PN(ind)=MetLagrange(X,Y,x(ind));
   end
end
figure(1)
hold on
plot(x,PN,'k','Linewidth',3);%Reprezentarea grafica a polinomului Lagrange
%Pn calculat prin metoda Newton cu DD
xlabel('x')
ylabel('y')
grid on
plot(x,f(x),'--r','Linewidth',2);
plot(X,f(X),'o','MarkerFaceColor','g','MarkerSize',10)
%Polinomul Lagrange Pn interpoleaza setul de date (Xi,f(Xi)), i.e.
%graficul functiei Pn trece prin punctele de interpolare (Xi,f(Xi).
%Mai mult, polinomul Pn aproximeaza functia f(x)

hold off
figure(2)
plot(x,f(x)-PN,'k','Linewidth',3)%reprezentarea erorii
title('Eroarea interpolarii')
xlabel('x')
ylabel('f(x)-Pn(x)')
grid on

#openfig('Fig1.fig');
