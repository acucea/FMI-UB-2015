function [ output_args ] = lab3( input_args )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
n = 100;
c = 10;

[X,Y] = genereazaMultimeAntrenare(n, c);
Ystar = aplicaClasificatorBayesian(X, c);
eroare =  calculeazaEroareDeMisclasare(Y, Ystar);


nrExemple = [10 10^2 10^3 10^4 10^5 10^6];
ploteazaEroareMisclasare(nrExemple,c);

end

function [X, Y] = genereazaMultimeAntrenare(n, c)

X = rand(n,1) * 4  * c;
Y = double( rand(n,1) < (X ./(X + c)));

end

function [Ystar] = aplicaClasificatorBayesian(X, c)

Ystar = double(X > c);

end

function [eroare] = calculeazaEroareDeMisclasare(Y, Ystar)

eroare = sum(Y ~= Ystar) / length(Y);


end

function [] = ploteazaEroareMisclasare(nrExemple,c)

%graficul erorii teoretice
figure(1)
eroareTeoretica = 0.305785;
semilogx(nrExemple, ones(1,length(nrExemple)) * eroareTeoretica,'r');
hold on
% se calculeaza eroarea de misclasare pentru multimi de antrenare
% de dimensiuni diferite date in vectorul nrExemple
eroareMisclasare = zeros(1,length(nrExemple));
for i = 1:length(nrExemple)
    n = nrExemple(i);
    % punctul a
    [X, Y] = genereazaMultimeAntrenare(n,c);
    % punctul b
    Ystar = aplicaClasificatorBayesian(X,c);
    % punctul c
    eroareMisclasare(i) = calculeazaEroareDeMisclasare(Y,Ystar);
end

% graficul erorilor de misclasare determinate pe baza unor multimi de
% antrenare(avand ca dimensiuni valorile din vectorul nrExemple)
semilogx(nrExemple, eroareMisclasare,'.b');
title('Evolutia erorii de misclasare');
% legend('eroarea teoretica','eroarea empirica');
% axis([min(volum) max(volum) 0 1]);


end

% Punctul g)
function [X, Y] = genereazaMultimeAntrenare2(n, c)

% X este repartizat exponential de parametru lambda = c; 
% lambda reprezinta media unei variabile repartizate exponential(lambda)
lambda = c;
X = exprnd(lambda,n,1);

% Eticheta Y asociata lui X: are repartitia Bernoulli de parametru 
% p = eta(x), pentru X = x.
Y = double(rand(n,1) < (X./(X+c)));

end
