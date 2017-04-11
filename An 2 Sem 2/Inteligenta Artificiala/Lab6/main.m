function [ ] = main( )

%datele: exemplele + etichetele
X = [0 0 0 0.5 0.5 0.5 1 1 -50 ; 0 0.5 1 0 0.5 1 0 0.5 40];
T = [1 1 1 1 -1 -1 -1 -1 1];
% etichetePrezise - random, diferit de T
etichetePrezise = [0 1 1 1 -1 -1 -1 -1 1];
%reprezentare grafica a datelor
figure(1), hold on;
eticheta1 = find(T==1);
etichetaMinus1 = find(T==-1);
plot(X(1,eticheta1),X(2,eticheta1),'or');
plot(X(1,etichetaMinus1),X(2,etichetaMinus1),'xg');
%axis([-2 2 -2 2]);
%pune pauza 2 secunde
%pause(2);
%creeaza perceptron
net = newp([-1 1;-1 +1],1,'hardlims');
%view(net);
%pause(5);
%afiseaza proprietatile perceptronului legate de vectorul de ponderi + bias
disp('Proprietati legate de vectorul de ponderi:');
disp(net.inputWeights{1});
%pause(3);
disp('Proprietati legate de bias:');
disp(net.biases{1});
%pause(3);
%initializeaza parametri retelei, implicit ponderile + bias sunt nule 
net = init(net);
%seteaza numarul de epoci pentru antrenare
net.trainParam.epochs = 1;
%antreneaza reteaua
net.inputWeights{1}.learnFcn = 'learnpn';
net.biases{1}.learnFcn = 'learnpn';
%numarul de epoci a scazut, e mai potrivit learnpn pt ca aveam varietate
%mai mare


epoci = 0;
while (isequal(etichetePrezise,T) == 0 )
    
    [net,antrenare] = train(net,X,T);
    figure(1);
    %ploteaza dreapta de separare
    plotpc(net.IW{1},net.b{1})
    title('Reprezentarea grafica a exemplelor de antrenare si a dreptei de separare');
    %simuleaza reteaua pentru datele de intrare
    etichetePrezise = sim(net,X);
    %pause(1);
    epoci = epoci + 1;
    
    
end

%initial 14 epoci
epoci
%dupa adaugarea punctului exterior, numarul de epoci a ramas acelasi

isequal(etichetePrezise,T) 


end

function [w b E] = algPerceptron(X, d, maxEpoci, ro)

[n m] = size(X);
X(n+1, : ) = ones(1,n);
W = rand(n+1, 1);
E = zeros(1, maxEpoci);
eroare = 1;
epoci = 0;
    while (eroare ~= 0 && epoci <= maxEpoci)
        for i = 1 : m
            y = hardlims ( X (:,i)' * W);
            W = W + ro * (d(i)-y) * X(:,i);
        end
        eroare = sum((d' - hardlims(X' * W)) ~= 0 )/m;
        epoci = epoci + 1;
        E(epoci) = eroare;

    end

    plot(1:epoci, E,'.r');

end


