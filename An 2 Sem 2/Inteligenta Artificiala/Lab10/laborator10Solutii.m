% Solutiile exercitiilor din Laboratorul 10


%--------------------------------------------------------------------------

% EX1:

X = [0 1 0 1; 0 0 1 1]; %input-urile
t = [0 1 1 0]; % target-urile

% Perceptronii de pe primul nivel sunt asociati dreptelor de ecuatii
% d1: - x - y + 1/2 = 0 si d2: x + y - 3/2 = 0
% Atentie: expresiile dreptelor au fost considerate astfel incat punctele
% situate in regiunea cuprinsa intre cele doua drepte sa fie situate in
% semiplanele negative in raport cu dreptele; conform cerintei exercitiului. 

net = newff(minmax(X),[2 1],{'hardlim','hardlim'}); % definim reteaua
net.IW{1,1} = [-1 -1; 1 1]; % matricea de ponderi de pe primul strat
net.LW{2,1} = [-1 -1]; % matricea de ponderi de pe al doilea strat
net.b{1} = [1/2; -3/2];
net.b{2} = 0.5; %bias-urile
a = sim(net, X);
isequal(a, t)

%--------------------------------------------------------------------------

% EX2:

% Punctul a)
net = newff(minmax(X),[3 1],{'hardlim','hardlim'}); % definim reteaua
net.IW{1,1} = [1 -1; -1 -1; 0 1]; % matricea de ponderi de pe primul strat
net.LW{2,1} = [1 1 1]; % matricea de ponderi de pe al doilea strat
net.b{1} = [1; 1; 0];
net.b{2} = -2.5; % bias-urile

% Punctul b)
puncteTest = 4 * rand(2,20000) - 2;

etichetePrezise = sim(net, puncteTest);
I1 = find(etichetePrezise == 1);
I0 = find(etichetePrezise == 0);
figure(1)
plot(puncteTest(1,I1), puncteTest(2,I1), '.r')
hold on
plot(puncteTest(1,I0), puncteTest(2,I0), '.b')

%--------------------------------------------------------------------------

% Crearea si antrenarea unei retele pentru recunoasterea/aproximarea
% functiei XOR

X = [0 1 0 1; 0 0 1 1]; % input-urile
t = [0 1 1 0]; % target-urile
net = newff(minmax(X),[5 1],{'logsig','logsig'}); % creare retea
net = train(net,X,t);
% iesirea retelei pentru functia de transfer 'logsig' setata pe nivelul de iesire 
a = sim(net, X);
% dupa antrenare se inlocuieste functia de transfer 'logsig', setata pe
% nivelul de iesire, cu functia de transfer 'hardlim'.
net.layers{2}.transferFcn = 'hardlim';
% etichetele pe care le asociaza reteaua punctelor de intrare din multimea de
% antrenare
a = sim(net, X);
% verificarea corectitudinii retelei
isequal(t, a);

%--------------------------------------------------------------------------

% Crearea si antrenarea unei retele pentru recunoasterea/aproximarea
% functiei indicator definite in EX2 (sau cu alte cuvinte pentru 
% recunoasterea clasei formate din punctele din interiorul triunghiului si 
% a clasei formate din punctele situate inafara triunghiului).

% Se considera data multimea de antrenare
X = 4 * rand(2,10000) - 2;
t = double((X(1,:) - X(2,:) + 1 >= 0) & (- X(1,:) - X(2,:) + 1 >= 0) & (X(2,:) >= 0)); 

% Plotarea multimii de antrenare
I1_train = find(t == 1);
I0_train = find(t == 0);
figure(2)
plot(X(1,I1_train), X(2,I1_train), '.r')
hold on
plot(X(1,I0_train), X(2,I0_train), '.b')

% Crearea si antrenarea retelei
net = newff(minmax(X),[10 1],{'logsig','logsig'}, 'traingdx'); % definim reteaua
net.trainParam.epochs = 2000;
net = train(net, X, t);
net.layers{2}.transferFcn = 'hardlim';

% Se considera multimea de testare
Xtest = 4 * rand(2,20000) - 2;
ttest = double((Xtest(1,:) - Xtest(2,:) + 1 >= 0) & (- Xtest(1,:) - Xtest(2,:) + 1 >= 0) & (Xtest(2,:) >= 0)); 

% Etichetele prezise de retea
etichetePrezise = sim(net, Xtest);

% Plotarea punctelor din multimea de testare conform cu etichetele prezise
% de retea
I1 = find(etichetePrezise == 1);
I0 = find(etichetePrezise == 0);
figure(3)
plot(Xtest(1,I1), Xtest(2,I1), '.r')
hold on
plot(Xtest(1,I0), Xtest(2,I0), '.b')

% Procentul de clasare corecta este 
clasareCorecta = 1 - sum(abs(ttest - etichetePrezise))/length(ttest) 

% Este recomandat sa repetati de un numar de ori reinitializarea ponderilor
% si bias-urilor, sa reantrenati reteaua si sa alegeti in final ponderile 
% si bias-urile pentru care eroarea de clasare pe o multime de validare este minima.
% In exemplul de mai sus, nu s-a folosit o tehnica de imbunatatire a
% generalizarii, precum regularizarea sau 'Early stopping'. A se consulta
% in acest sens Laboratorul 12.



