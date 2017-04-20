function solLab4()
nrExemple = 10;
sigma = 0.25;

% Definirea functiei inline f(x) = sin(2*pi*x)
f = inline('sin(2*pi*x)', 'x');

% Punctul b) - apelul punctului a)
S = genereazaExemple(nrExemple,sigma,f);
xS = S(:,1);
uS = S(:,2);

% Apelul punctului c)
ploteazaExemple(S)

% Apelul punctului d)
% n: gradul polinomului P cautat
n = 3;
P = gasestePolinomOptim(S,n);

% Apelul punctului e)
hold on
ploteazaGraficPolinom(P)
% disp('Apasati orice tasta pentru a continua!')
% pause
% hold off

% Apelul punctului f)
eticheteCorecte = uS;
etichetePrezise = polyval(P,xS);
[eroare] = calculeazaEroare(eticheteCorecte, etichetePrezise);

% Punctul g)
% n: gradul polinomului
figure, hold on
for n = 1:9
    P = gasestePolinomOptim(S,n);
    subplot(3,3,n)
    hold on
    ploteazaExemple(S);
    ploteazaGraficPolinom(P);
    title(['Polinom de grad ' num2str(n)])
    axis([0 1 -3 3]);
end

% Punctele h) si i)
% genereaza exemple test
nrExempleTest = 10;
exempleT = genereazaExemple(nrExempleTest, sigma, f);
xT = exempleT(:,1);
uT = exempleT(:,2);

for n = 1:9
    P = gasestePolinomOptim(S,n);
    etichetePreziseS = polyval(P,xS);
    eroareS(n) = calculeazaEroare(uS,etichetePreziseS);
    
    % Atentie: pentru calculul etichetelor prezise pentru puncte din 
    % multimea de test se foloseste polinomul P determinat pe baza multimii 
    % de antrenare S
    etichetePreziseT = polyval(P,xT);
    eroareT(n) = calculeazaEroare(uT,etichetePreziseT);
end
gradPolinom = 1:9;
figure, hold on
plot(gradPolinom, eroareS,'r');
plot(gradPolinom, eroareT,'b');
legend('eroarea pe exemplele de antrenare','eroarea pe exemplele de test');

% Punctul j)
gradPolinom = 1:1:6;
figure, hold on
% Multimea de antrenare
S1 = S(1:7,:);
% Multimea de validare
S2 = S(8:size(S,1),:);

xS = S1(:,1);
uS = S1(:,2);
xT = S2(:,1);
uT = S2(:,2);

eroareS = zeros(1,length(gradPolinom));
eroareValidare = zeros(1,length(gradPolinom));
for i = 1:length(gradPolinom);
    P = gasestePolinomOptim(S1,gradPolinom(i)); 
    subplot(2,3,i);hold on;
    ploteazaExemple(S1);
    % plotarea exemplelor de test
    plot(S2(:,1), S2(:,2), '*r')
    ploteazaGraficPolinom(P);
    title(['Polinom de grad ' num2str(gradPolinom(i))]);
    axis([0 1 -3 3]);
    
    etichetePreziseS = polyval(P,xS);
    eroareS(i) = calculeazaEroare(uS,etichetePreziseS);
    
    etichetePreziseT = polyval(P,xT);
    eroareValidare(i) = calculeazaEroare(uT,etichetePreziseT);
end

figure, hold on
plot(gradPolinom, eroareS,'r');
plot(gradPolinom, eroareValidare,'b');
legend('eroarea pe exemplele de antrenare S1','eroarea pe exemplele de validare S2');

eroareValidare
gradOptim = gradPolinom(find(eroareValidare == min(eroareValidare)))

end

% Punctul a)
function [S] = genereazaExemple(nrExemple,sigma,f)
% x contine valori de selectie asupra unei variabile aleatoare repartizate
% uniform pe [0,1]
x = rand(nrExemple,1);
% eps_i: valoare de selectie asupra unei variabile aleatoare repartizate
% normal de medie 0 si deviatie standard sigma;
% Z este o matrice de dimensiune m x n continand valori de selectie asupra
% unei v.a. repartizate normal de medie miu si deviatie standard sigma
% atunci Z = sigma * randn(m,n) + miu
u = f(x) + sigma * randn(nrExemple,1);
S = [x u];
end

% Punctul c)
function ploteazaExemple(S)
% reprezinta grafic punctele de forma (xi,ui), valorile xi reprezinta
% abscisele punctelor, iar ui ordonatele
plot(S(:,1), S(:,2), '.b')
end

% Punctul d)
% n: gradul polinomului
function P = gasestePolinomOptim(S,n)
x = S(:,1);
u = S(:,2);
% P este un vector linie ce contine coeficientii polinomului P(x) precum urmeaza:
% P(x) = P(1)*x^n + P(2)*x^(n-1) + ... + P(n)*x + P(n+1)
P = polyfit(x,u,n);
end

% Punctul e)
function ploteazaGraficPolinom(P)
% x: vector continand valori ce vor fi reprezentate pe axa oX
x = 0:0.01:1;
% etichetePrezise: vector continand valori ce vor fi reprezentate pe oY
etichetePrezise = polyval(P,x);
plot(x,etichetePrezise,'r');
end

% Punctul f)
function [eroare] = calculeazaEroare(eticheteCorecte, etichetePrezise)
% eroare = media diferentelor dif_i la patrat calculate pentru fiecare punct xi
% dif_i = eticheta prezisa i - eticheta corecta i
eroare = mean((etichetePrezise - eticheteCorecte).^2); 
end








