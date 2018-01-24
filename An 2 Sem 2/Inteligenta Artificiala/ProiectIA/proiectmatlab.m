function [ ] = proiectMatlab()

% UNTITLED Summary of this function goes here
% Detailed explanation goes here
% Id,Prediction
clear all;
stream = RandStream('mt19937ar','Seed',125);
RandStream.setDefaultStream(stream);

[Test] = load('testData.mat');
[Ex] = load('trainData.mat');
%[WB] = load('network27.mat');

%net = WB.net2;
Test.testVectors = (Test.testVectors' )  ;
%/ 12.3730;
Test.testVector = Test.testVectors ;

Ex.trainVectors = (Ex.trainVectors' ) ;
%/ 12.3730;
Ex.trainLabels = Ex.trainLabels';

[coefs,score] = pca(Ex.trainVectors);

size(coefs)
size(score)

%trainNetwork(Ex,Test);


end

function [] = trainNetwork(Ex, Test)


MP = [];

[m n ] = size(Ex.trainLabels) ;

for i = 1:n
    
    if (Ex.trainLabels(i) == 1)
        MP = [MP ; 1 0 0 0 0];
    elseif (Ex.trainLabels(i) == 2)
        MP = [MP ; 0 1 0 0 0];
    elseif (Ex.trainLabels(i) == 3)
        MP = [MP ; 0 0 1 0 0];
    elseif (Ex.trainLabels(i) == 4)
        MP = [MP ; 0 0 0 1 0];
    elseif (Ex.trainLabels(i) == 5)
        MP = [MP ; 0 0 0 0 1];
    end
    
end

%poslin
net = newff(minmax(Ex.trainVectors),[15,10,5] ,{'tansig','tansig','logsig'});

%net.performFcn = 'sse';

net.performFcn = 'mse';
net.trainFcn = 'traingdx';

%net.trainFcn = 'traingda';
%net.trainFcn = 'trainoss';
%net.trainFcn = 'trainlm';
% net.trainFcn = 'traingdx';
%try this next
%net.trainFcn = 'trainoss';
%net.trainFcn = 'trainbfg';
% net.performFcn = 'msereg';
% net.performParam.ratio = 0.5;
%net.performFcn = 'trainbr';

%net.trainFcn = 'trainr';

net.trainParam.showWindow = false;
net.trainParam.showCommandLine = false;

net.trainParam.epochs = 10000;
net.trainParam.goal = 0;
net.trainParam.max_fail = 50;
net.trainParam.lr = 0.00001;
net.trainParam.min_grad = 0;


% net.divideFcn = 'dividerand';
% net.divideParam.trainRatio = 0.7;
% net.divideParam.valRation = 0.3;
% net.divideParam.testRatio = 0.1;

trainRatio = 0.9;
testRatio = 0;
validRatio = 0.1;


train = [];
test = [];
valid = [];

net.divideFcn = 'divideind';

%[train test valid ] = genereazaIndici(MP, trainRatio , testRatio, validRatio);
% size(train)
% size(test)
% size(valid)

% net.divideParam.trainInd = train;
% net.divideParam.valInd = test;
% net.divideParam.testInd = valid;


%net = antreneazaRetea(net , Ex.trainVectors,Ex.trainLabels , MP);
%Train 1 

net2 = [];
eroareMin = 1;
eroare = 1 ;
epoca = 0;
while eroare > 0.001
    
epoca = epoca + 1;

if epoca == 50
    net.trainParam.max_fail = 10;
end
ordering = randperm(size(Ex.trainVectors,2));

Ex.trainVectors = Ex.trainVectors(:,ordering);
Ex.trainLabels = Ex.trainLabels(:,ordering);
MP = MP(ordering,:);

[train test valid ] = genereazaIndici(MP,trainRatio , testRatio, validRatio);

net.divideParam.trainInd = train;
net.divideParam.testInd = test;
net.divideParam.valInd = valid;

[net eroare] = antreneazaRetea(net , Ex.trainVectors,Ex.trainLabels , MP);
if(eroare < eroareMin)
    eroareMin = eroare;
    net2 = net;
    save('network28','net2');
end

disp(sprintf('Epoca : %d',epoca));
disp(eroare);
disp(eroareMin);



end





% %train 1 
% net.divideParam.trainInd = 1:8000;
% net.divideParam.valInd = 8001:9873;
% net.divideParam.testInd = 8001:9873;
% 
% net = antreneazaRetea(net , Ex.trainVectors,Ex.trainLabels , MP);
% 
% %train 2
% net.divideParam.trainInd = [1:7000 8001:9873];
% net.divideParam.valInd = [7001:8000];
% net.divideParam.testInd = [7001:8000];
% 
% net = antreneazaRetea(net , Ex.trainVectors,Ex.trainLabels , MP);
% net = init(net);
% %train 3
% net.divideParam.trainInd = [1:6000 7001:9873];
% net.divideParam.valInd = [6001:7000];
% net.divideParam.testInd = [6001:7000];
% 
% net = antreneazaRetea(net , Ex.trainVectors,Ex.trainLabels , MP);
% 
% %train 4
% net.divideParam.trainInd = [1:5000 6001:9873];
% net.divideParam.valInd = [5001:6000];
% 
% net = antreneazaRetea(net , Ex.trainVectors,Ex.trainLabels , MP);
% 
% %train 5
% net.divideParam.trainInd = [1:4000 5001:9873];
% net.divideParam.valInd = [4001:5000];
% 
% net = antreneazaRetea(net , Ex.trainVectors,Ex.trainLabels , MP);
% 
% %train 6
% net.divideParam.trainInd = [1:3000 4001:9873];
% net.divideParam.valInd = [3001:4000];
% 
% net = antreneazaRetea(net , Ex.trainVectors,Ex.trainLabels , MP);
% 
% %train 7
% net.divideParam.trainInd = [1:2000 3001:9873];
% net.divideParam.valInd = [2001:3000];
% 
% net = antreneazaRetea(net , Ex.trainVectors,Ex.trainLabels , MP);
% 
% %train 8
% net.divideParam.trainInd = [1:1000 2001:9873];
% net.divideParam.valInd = [1001:2000];
% 
% net = antreneazaRetea(net , Ex.trainVectors,Ex.trainLabels , MP);
% 
% %train 9
% net.divideParam.trainInd = [1001:9873];
% net.divideParam.valInd = [1:1001];
% 
% net = antreneazaRetea(net , Ex.trainVectors,Ex.trainLabels , MP);
% 
% %train 10
% net.divideParam.trainInd = [1:7000 8001:9873];
% net.divideParam.valInd = [7001:8000];
% 
% net = antreneazaRetea(net , Ex.trainVectors,Ex.trainLabels , MP);

% eroare = 1;
% while eroare > 0.001 
%     
%    [net eroare]= antreneazaRetea(net , Ex.trainVectors,Ex.trainLabels , MP);
%     eroare
% end

% eroare = 1;
% while eroare > 0.001
%     
%     [net eroare]= antreneazaRetea(net , Ex.trainVectors,Ex.trainLabels , MP);
%     eroare
%     
%end

save('network26','net2');
scrieCSV(net2,Test,'program23.csv');

playSong();

%csvwrite('retea2.csv',retea);
%csvwrite('program4.csv',FinalRez);


end


function [net eroare] = antreneazaRetea(net , MA ,ETICHETE, MP)


[net antrenare] = train(net,MA,MP');

% figure
% plot(antrenare.epoch, antrenare.perf);


EtichetaRetea = sim(net, MA);
EtichetaRetea = compet(EtichetaRetea);
EtichetaProf = ETICHETE;

[n m] = size(EtichetaRetea);

Rez = [];
for i = 1:m
    
    if (isequal(EtichetaRetea(:,i)',[1 0 0 0 0] ))
        
        Rez = [Rez ; 1];
    elseif (isequal(EtichetaRetea(:,i)',[0 1 0 0 0] ))
        
        Rez = [Rez ; 2];
    elseif (isequal(EtichetaRetea(:,i)',[0 0 1 0 0] ))
        
        Rez = [Rez ; 3];
    elseif (isequal(EtichetaRetea(:,i)',[0 0 0 1 0] ))
        
        Rez = [Rez ; 4];
    elseif (isequal(EtichetaRetea(:,i)',[0 0 0 0 1] ))
        
        Rez = [Rez ; 5];
    end
    
end

eroare = sum(EtichetaProf ~=  Rez')/length(Rez);
%plotconfusion(EtichetaProf,Rez');


end

function [indici_antrenare, indici_test, indici_validare] = genereazaIndici(trainLabels, tr, ts, val)

indici_antrenare = [];
indici_test = [];
indici_validare = [];


[n m] = size(trainLabels);

Rez = [];
for i = 1:n
    
    if (isequal(trainLabels(i,:),[1 0 0 0 0] ))
        
        Rez = [Rez ; 1];
    elseif (isequal(trainLabels(i,:),[0 1 0 0 0] ))
        
        Rez = [Rez ; 2];
    elseif (isequal(trainLabels(i,:),[0 0 1 0 0] ))
        
        Rez = [Rez ; 3];
    elseif (isequal(trainLabels(i,:),[0 0 0 1 0] ))
        
        Rez = [Rez ; 4];
    elseif (isequal(trainLabels(i,:),[0 0 0 0 1] ))
        
        Rez = [Rez ; 5];
    end
    
end



I1 = find(Rez == 1);
I2 = find(Rez == 2);
I3 = find(Rez == 3);
I4 = find(Rez == 4);
I5 = find(Rez == 5);


% size(I1)
% size(I2)
% size(I3)
% size(I4)
% size(I5)

m = size(I1,1);
for i = 1:m
    if(i / m <= tr)
        indici_antrenare = [indici_antrenare i];
    elseif (i / m <= tr + ts)
        indici_test = [indici_test i];
    elseif(i / m <= tr + ts + val)
        indici_validare = [indici_validare i];
    end
end

m = size(I2,1);
for i = 1:m
    if(i / m <= tr)
        indici_antrenare = [indici_antrenare i];
    elseif (i / m <= tr + ts)
        indici_test = [indici_test i];
    elseif(i / m <= tr + ts + val)
        indici_validare = [indici_validare i];
    end
end

m = size(I3,1);
for i = 1:m
    if(i / m <= tr)
        indici_antrenare = [indici_antrenare i];
    elseif (i / m <= tr + ts)
        indici_test = [indici_test i];
    elseif(i / m <= tr + ts + val)
        indici_validare = [indici_validare i];
    end
end

m = size(I4,1);
for i = 1:m
    if(i / m <= tr)
        indici_antrenare = [indici_antrenare i];
    elseif (i / m <= tr + ts)
        indici_test = [indici_test i];
    elseif(i / m <= tr + ts + val)
        indici_validare = [indici_validare i];
    end
end

m = size(I5,1);
for i = 1:m
    if(i / m <= tr)
        indici_antrenare = [indici_antrenare i];
    elseif (i / m <= tr + ts)
        indici_test = [indici_test i];
    elseif(i / m <= tr + ts + val)
        indici_validare = [indici_validare i];
    end
end

end



function scrieCSV (net, Test, nume)

X = sim(net, Test.testVectors);

X = compet(X);

[n m] = size(X);

Rez = [];
for i = 1:m
    
    if (isequal(X(:,i)',[1 0 0 0 0] ))
        
        Rez = [Rez ; 1];
    elseif (isequal(X(:,i)',[0 1 0 0 0] ))
        
        Rez = [Rez ; 2];
    elseif (isequal(X(:,i)',[0 0 1 0 0] ))
        
        Rez = [Rez ; 3];
    elseif (isequal(X(:,i)',[0 0 0 1 0] ))
        
        Rez = [Rez ; 4];
    elseif (isequal(X(:,i)',[0 0 0 0 1] ))
        
        Rez = [Rez ; 5];
    end
    
end

FinalRez = [];
for i = 1:m
    FinalRez = [FinalRez ; [i Rez(i)]];
end

csvwrite(nume,FinalRez);


end


function playSong


notecreate = @(frq,dur) sin(2*pi* [1:dur]/8192 * (440*2.^((frq-1)/12)));
notename = {'A' 'A#' 'B' 'C' 'C#' 'D' 'D#' 'E' 'F' 'F#' 'G' 'G#'};
song = {'A' 'A' 'E' 'E' 'F#' 'F#' 'E' 'E' 'D' 'D' 'C#' 'C#' 'B' 'B' 'A' 'A'};
for k1 = 1:length(song)
    idx = strcmp(song(k1), notename);
    songidx(k1) = find(idx);
end
dur = 0.3*8192;
songnote = [];
for k1 = 1:length(songidx)
    songnote = [songnote; [notecreate(songidx(k1),dur)  zeros(1,75)]'];
end
soundsc(songnote, 8192)

end

