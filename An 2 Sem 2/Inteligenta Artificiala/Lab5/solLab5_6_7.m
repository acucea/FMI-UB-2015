function solLab5_6_7()
% Fisierul contine cateva tipuri de probleme din laboratoarele 5, 6 si 7
% Atentie: revedeti si celelalte probleme facute si discutate in cadrul
% laboratorului!!!

% In Laboratorul 7

%datele: exemplele + etichetele
X = [0 0 0 0.5 0.5 0.5 1 1;0 0.5 1 0 0.5 1 0 0.5];
T = [1 1 1 1 -1 -1 -1 -1];

%----------------------------------------------------------
%reprezentare grafica a datelor
figure(1), hold on; 
eticheta1 = find(T == 1);
etichetaMinus1 = find(T==-1);
plot(X(1,eticheta1),X(2,eticheta1),'or');
plot(X(1,etichetaMinus1),X(2,etichetaMinus1),'*b');
axis([-2 2 -2 2]);

%----------------------------------------------------------
%creeaza perceptron
net = newp([-1 1;-1 +1],1,'hardlims');

%----------------------------------------------------------
%afiseaza proprietatile perceptronului legate de vectorul de ponderi + bias
disp('Proprietati legate de vectorul de ponderi:')
disp(net.inputWeights{1})
% pause(3);
disp('Proprietati legate de bias:');
disp(net.biases{1});
% pause(3);
%initializeaza parametrii retelei, implicit ponderile + bias sunt nule
net = init(net);

%----------------------------------------------------------
%seteaza numarul de epoci pentru antrenare
net.trainParam.epochs = 100;

%----------------------------------------------------------
%antreneaza reteaua
[net,antrenare] = train(net,X,T);
figure(1);

%----------------------------------------------------------
%ploteaza dreapta de separare
plotpc(net.IW{1},net.b{1})
title('Reprezentarea grafica a exemplelor de antrenare si a dreptei de separare'); 

%----------------------------------------------------------
%simuleaza reteaua pentru datele de intrare
etichetePrezise = sim(net,X);
isequal(etichetePrezise,T)

%----------------------------------------------------------

% Punctul 1
net = newp([-1 1;-1 +1],1,'hardlims');
net.inputWeights{1}.initFcn = 'rands';
net.biases{1}.initFcn = 'rands';
net = init(net);
net.trainParam.epochs = 100;
%antreneaza reteaua
[net,antrenare] = train(net,X,T);

%----------------------------------------------------------

% Punctul 2
net = newp([-1 1;-1 +1],1,'hardlims');
net.inputWeights{1}.initFcn = 'rands';
net.biases{1}.initFcn = 'rands';
net.trainParam.epochs = 1;
net.trainParam.showWindow = 0;
net = init(net);
eroare = 1;
epoca= 0;

while (eroare > 0) && (epoca < 500)
    epoca = epoca + 1;
    net = train(net,X,T);
    figure,hold on;
    title(['Epoca ' num2str(epoca)]);
    eticheta1 = find(T == 1);
    etichetaMinus1 = find(T == -1);
    plot(X(1,eticheta1),X(2,eticheta1),'or');
    plot(X(1,etichetaMinus1),X(2,etichetaMinus1),'*b');
    axis([-2 2 -2 2]);
    plotpc(net.IW{1},net.b{1})
    pause(1);
    hold off
    eroare = sum(T ~= sim(net, X));
end
disp(['Epoca: ' num2str(epoca)])

%----------------------------------------------------------

% Punctul 3
close all;
X = [X [-50; 40]]
T = [T 1]

figure(1),hold on;
eticheta1 = find(T==1);
etichetaMinus1 = find(T==-1);
plot(X(1,eticheta1),X(2,eticheta1),'or');
plot(X(1,etichetaMinus1),X(2,etichetaMinus1),'*b');
axis([-52 2 -2 42]);
net = newp([-1 1;-1 +1],1,'hardlims');
net.inputWeights{1}.initFcn = 'rands';
net.biases{1}.initFcn = 'rands';
net.trainParam.epochs = 1;
net = init(net);

eroare = 1;
epoca= 0;

while (eroare > 0) && (epoca < 500)
    epoca = epoca + 1;
    net = train(net,X,T);
%     figure,hold on;
%     title(['Epoca ' num2str(epoca)]);
%     eticheta1 = find(T == 1);
%     etichetaMinus1 = find(T == -1);
%     plot(X(1,eticheta1),X(2,eticheta1),'or');
%     plot(X(1,etichetaMinus1),X(2,etichetaMinus1),'*b');
%     axis([-2 2 -2 2]);
%     plotpc(net.IW{1},net.b{1})
%     pause(1);
    hold off
    eroare = sum(T ~= sim(net, X));
end

disp(['Epoca: ' num2str(epoca)])

% Se observa ca prin introducerea punctului discordant (avand o norma mare)
% [-50; 40] convergenta este mult mai lenta (numarul de epoci creste).

%---------------------------------------------------------- 

% Punctul 4)
figure(1),hold on;
eticheta1 = find(T==1);
etichetaMinus1 = find(T==-1);
plot(X(1,eticheta1),X(2,eticheta1),'or');
plot(X(1,etichetaMinus1),X(2,etichetaMinus1),'*b');
axis([-52 2 -2 42]);
% se modifica regula de invatare, din varianta implicita 'learnp' in 'learnpn'
% revedeti diferenta dintre cele doua reguli discutata in cadrul
% laboratorului
net = newp([-1 1;-1 +1],1,'hardlims', 'learnpn');
net.inputWeights{1}.initFcn = 'rands';
net.biases{1}.initFcn = 'rands';
net.trainParam.epochs = 1;
net = init(net);

eroare = 1;
epoca= 0;

while (eroare > 0) && (epoca < 500)
    epoca = epoca + 1;
    net = train(net,X,T);
%     figure,hold on;
%     title(['Epoca ' num2str(epoca)]);
%     eticheta1 = find(T == 1);
%     etichetaMinus1 = find(T == -1);
%     plot(X(1,eticheta1),X(2,eticheta1),'or');
%     plot(X(1,etichetaMinus1),X(2,etichetaMinus1),'*b');
%     axis([-2 2 -2 2]);
%     plotpc(net.IW{1},net.b{1})
%     pause(1);
    hold off
    eroare = sum(T ~= sim(net, X));
end

disp(['Epoca: ' num2str(epoca)])

% Numarul de epoci necesare pentru a determina dreapta de separare scade.


%---------------------------------------------------------- 

% Punctul 5 - vezi punctele c si d din Laborator 6

% punctul c) - Generarea multimii de antrenare
m = 50; % numarul de exemple din multimea de antrenare
X = 2*rand(2,m) - 1;
% Pentru ca punctele aflate deasupra primei bisectoare sa aiba clasa 1 
% (adica sa se afle in semiplanul pozitiv fata de prima bisectoare) se
% considera ecuatia dreptei de forma -x + y = 0
T = double(-X(1,:) + X(2,:) > 0);

deplasare = 0.3;
eticheta1 = find(T == 1);
etichetaMinus1 = find(T == 0);
T(etichetaMinus1) = -1;
X(2,eticheta1) = X(2,eticheta1) + deplasare;
X(2,etichetaMinus1) = X(2,etichetaMinus1) - deplasare;
plot(X(1,eticheta1),X(2,eticheta1),'or');
hold on
plot(X(1,etichetaMinus1),X(2,etichetaMinus1),'*b');

% punctul d)
m = [10 50 100 250 500];
deplasare = [0.5 0.3 0.1 0.01 -0.1 -0.3];

for i = 1:length(m)
    for j = 1:length(deplasare)
        
        X = 2*rand(2,m(i)) - 1;
        T = double(-X(1,:) + X(2,:) > 0);

        eticheta1 = find(T == 1);
        etichetaMinus1 = find(T == 0);
        T(etichetaMinus1) = -1;
        X(2,eticheta1) = X(2,eticheta1) + deplasare(j);
        X(2,etichetaMinus1) = X(2,etichetaMinus1) - deplasare(j);
        
        figure((i - 1)*length(deplasare) + j)
%         subplot(length(m),length(deplasare),(i - 1)*length(deplasare) + j)
        plot(X(1,eticheta1),X(2,eticheta1),'or');
        hold on
        plot(X(1,etichetaMinus1),X(2,etichetaMinus1),'*b');
        
        eroare = 1;
        epoca= 0;
        net = newp([-2 2; -2 2],1,'hardlims');
        net.trainParam.epochs = 1;
        net.trainParam.showWindow = 0;
        while (eroare > 0) && (epoca < 50)
            epoca = epoca + 1;
            net = train(net,X,T); 
            eroare = sum(T ~= sim(net, X));        
        end
        plotpc(net.IW{1},net.b{1})
        title(['Epoca ' num2str(epoca)]);
        
    end
end

% Punctul 6 din Laborator 7
% Definirea unui perceptron care sa invete fara eroare functia AND
X = [0 0 1 1; 0 1 0 1];
T = [0 0 0 1];
net = newp([0,1; 0 1],1);
net.IW{1} = [1 1];
net.b{1} = -2;
y = sim(net, X);
isequal(T,y)

% Definirea unui perceptron care sa invete fara eroare functia OR
X = [0 0 1 1; 0 1 0 1];
T = [0 1 1 1];
net = newp([0,1; 0 1],1);
net.IW{1} = [1 1];
net.b{1} = -1;
y = sim(net, X);
isequal(T,y)

% Nu se poate defini un perceptron care sa invete functia XOR!

% Punctul 7 din Laborator 7
% Implicit, folosind functia train se executa algoritmul de antrenare varianta
% online/incrementala, datorita setarii net.trainFcn = 'trainc'
% Prin functia train se poate executa si algoritmul de antrenare varianta
% offline/batch daca inainte de a folosi functia train facem setarea
% net.trainFcn = 'trainb'

end