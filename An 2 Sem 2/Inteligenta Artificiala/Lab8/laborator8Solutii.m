function solLab8()
close all;
% Multimea de antrenare
X = [[-2; 2] [-2; 3] [-1; 1] [-1; 4] [0; 0] [0; 1] [0; 2] [0; 3] [1; 0] [1; 1] [2; 1]...
    [2; 2] [3; -1] [3; 0] [3; 1] [3; 2] [4; -2] [4; 1] [5; -1] [5; 0]];
T = [-1 -1 -1 -1 -1 -1 -1 -1 1 -1 1 -1 1 1 1 1 1 1 1 1];

[n m] = size(X);

% % Punctul 1: Reprezentarea grafica a multimii de anternare
% plotpv(X,hardlim(T));
% 
% % Punctul 2: Solutia wbar = (wstar, bstar) care minimizeaza functia de eroare J(w,b)
% Xbar = [X; ones(1,size(X,2))];
% wbar = (Xbar*Xbar')^(-1) * Xbar * T';
% wstar = wbar(1:n)';
% bstar = wbar(n+1);
% plotpc(wstar, bstar);
% title('S-au considerat un perceptron cu bias si (wstar, bstar)')
% 
% 
% % Punctul 3
% net = newlin(X,T,[0],0.005);
% net.trainParam.epochs = 200;
% net.trainParam.goal = 0;
% [net tr Y E] = train(net,X,T);
% % nrEpoci: vector continand numarul epocii curente
% nrEpoci = tr.epoch;
% % performanta: vector continand valorile functiei de eroare, 
% %'mse' - media patratelor erorilor, calculate dupa fiecare epoca
% performanta = tr.perf;
% % valoarea functiei de eroare calculata dupa antrenare se poate obtine
% % folosind functia: mse(E)
% 
% % Y = sim(net,X)
% % E = T - sim(net,X)
% 
% % figure
% % plot(nrEpoci,performanta)
% 
% figure, hold on
% plotpv(X,hardlim(T));
% 
% 
% % Plotarea dreptei de separare de forma w1*x1 + w2*x2 + b = 0. Atentie: a nu
% % se confunda cu dreapta de regresie; in cazul problemei de fata deoarece
% % avem ca intrari puncte bidimensionale avem plan de regresie.
% plotpc(net.IW{1},net.b{1});
% title('S-au considerat un perceptron cu bias si(w\_antrenare, b\_antrenare)')
% 
% % % Punctul 4
% 
% wstar_noBias = (X*X')^(-1) * X * T';
% figure, hold on
% plotpv(X,hardlim(T));
% plotpc(wstar_noBias', 0);
% title('S-au considerat un perceptron fara bias si wstar')
% 
% % Punctul 5
% net = newlin(X,T,[0],0.005);
% net.biasConnect = 0; % pentru a crea/defini un perceptron ce nu contine bias
% net.trainParam.epochs = 200;
% net.trainParam.goal = 0;
% [net tr Y E] = train(net,X,T);
% figure, hold on
% plotpv(X,hardlim(T));
% plotpc(net.IW{1},0);
% title('S-au considerat un perceptron fara bias si w\_antrenare')
% 
% % Punctul 6
% pas = 0.05;
% x = -0.3:pas:0.3;
% y = -0.3:pas:0.3;
% [W1 W2] = meshgrid(x,y)
% J = zeros(size(W1));
% for i = 1:size(W1,1)*size(W1,2)
%     w = [W1(i) W2(i)];
%     J(i) = mse(T - w * X);
% end
% 
% figure, hold on
% grid on
% surf(W1, W2, J);

% Punctul 7
net = newlin(X,T,[0],0.005);
net.biasConnect = 0; % pentru a crea/defini un perceptron ce nu contine bias
net.trainParam.epochs = 1;
net.trainParam.goal = 0;
% figure, hold on
epoca = 0;
maxEp = 100;
er = zeros(maxEp,1);
while (epoca <= maxEp)
    epoca = epoca + 1;
    [net tr Y E] = train(net,X,T);
    w(epoca,:) = net.IW{1};
    er(epoca) = mse(T - sim(net,X)); 
end

plot3(w(:,1), w(:,2), er, '*g')








% Punctul 8: la fiecare iteratie se alege aleator un exemplu din multimea
% de antrenare pentru care se actualizeaza vectorul de ponderi w si bias-ul b
% Pentru implementarea algoritmului de antrenare dupa crearea
% retelei/perceptronului se face setarea:
% net.trainFcn = 'trainr';

% Punctul 9: aceasta este varianta incrementala clasica 
% Se face setarea:
% net.trainFcn = 'trainc';

end