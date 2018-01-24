function [ ] = proiectMatlab()

% UNTITLED Summary of this function goes here
% Detailed explanation goes here
% Id,Prediction

stream = RandStream('mt19937ar','Seed',9);
RandStream.setDefaultStream(stream);


[Test] = load('testData.mat');
[Ex] = load('trainData.mat');
%[WB] = load('reteaFirstSave.mat');

%net = WB.net;
Test.testVectors = (Test.testVectors' ) ;
Test.testVector = Test.testVectors ;

Ex.trainVectors = (Ex.trainVectors' ) ;
Ex.trainLabels = Ex.trainLabels';

size(Ex.trainVectors);

minmax(minmax(Ex.trainVectors)');
minmax(minmax(Test.testVectors)');

trainNetwork(Ex,Test);


end

function [] = trainNetwork(Ex, Test)

% MP = [];
% 
% [m n ] = size(Ex.trainLabels) ;
% 
% for i = 1:n
%     
%     if (Ex.trainLabels(i) == 1)
%         MP = [MP ; 1 0 0 0 0];
%     elseif (Ex.trainLabels(i) == 2)
%         MP = [MP ; 0 1 0 0 0];
%     elseif (Ex.trainLabels(i) == 3)
%         MP = [MP ; 0 0 1 0 0];
%     elseif (Ex.trainLabels(i) == 4)
%         MP = [MP ; 0 0 0 1 0];
%     elseif (Ex.trainLabels(i) == 5)
%         MP = [MP ; 0 0 0 0 1];
%     end
%     
% end

net = newff(minmax(Ex.trainVectors),[40,15,5] ,{'tansig','tansig','logsig'});

%net.performFcn = 'sse';

net.trainFcn = 'traingdx';
% net.trainFcn = 'traingda';
%net.trainFcn = 'trainbr';
%net.trainFcn = 'trainlm';
% net.trainFcn = 'traingdx';
%try this next
%net.trainFcn = 'trainoss';
%net.trainFcn = 'trainbfg';
% net.performFcn = 'msereg';
% net.performParam.ratio = 0.5;

%net.trainFcn = 'trainr';




net.trainParam.show = 10;
net.trainParam.epochs = 8000;
net.trainParam.goal = 0;

%net.trainParam.mc = 0.95;

%net.trainParam.max_fail = 100;

net.trainParam.lr = 0.001;
net.trainParam.min_grad = 0.000000000000001;






% size(Ex.trainVectors);
% size(MP);
% 
% % i = 1;
% % j = 2;
% % MP = MP(:,[1:i-1,j,i+1:j-1,i,j+1:end]);
% 
% size(Ex.trainVectors);
% size(MP);




net;

k = 10;
trainIdxs = cell(1,k);
testIdxs = cell(1,k);
trainMatrix = cell(1,k);
validMatrix = cell(1,k);
MP = cell(1,k);
cv = cvpartition(9873,'kfold',k);

for i=1:k
    
    trainIdxs{i} = find(training(cv,i));
    testIdxs{i}  = find(test(cv,i));
    
    trainMatrix{i} = [ Ex.trainVectors(:,trainIdxs{i})'  Ex.trainLabels(:,trainIdxs{i})'];
    validMatrix{i}  = [ Ex.trainVectors(:,testIdxs{i})'  Ex.trainLabels(:,testIdxs{i})'];

    MP1 = [];

    [m n ] = size(Ex.trainLabels(:,trainIdxs{i})');

    for j = 1:m

        if (Ex.trainLabels(j) == 1)
            MP1 = [MP1 ; 1 0 0 0 0];
        elseif (Ex.trainLabels(j) == 2)
            MP1 = [MP1 ; 0 1 0 0 0];
        elseif (Ex.trainLabels(j) == 3)
            MP1 = [MP1 ; 0 0 1 0 0];
        elseif (Ex.trainLabels(j) == 4)
            MP1 = [MP1 ; 0 0 0 1 0];
        elseif (Ex.trainLabels(j) == 5)
            MP1 = [MP1 ; 0 0 0 0 1];
        end

    end
    
    MP{i} = MP1;
    
end

for i = 1 : k
   
 
%     size(trainMatrix{i}(:,1:400)')
%     size(MP{i}(:,:))

    [net perform] = antreneazaRetea(net,trainMatrix{i}(:,1:400)', trainMatrix{i}(:,401)',MP{i});
    
    
    %plotperform(perform);
    
    
end

save('network16','net');
scrieCSV(net,Test,'program16.csv');


playSong();



% net.divideFcn = 'dividerand';
% net.divideParam.trainRatio = 0.7;
% net.divideParam.valRatio = 0.15;
% net.divideParam.testRatio = 0.15;
% 
% net.divideFcn = 'divideind';
% 
% 
% %train 1 
% net.divideParam.trainInd = 1:8000;
% net.divideParam.valInd = 8001:9873;
% %net.divideParam.testInd = 8001:9873;
% 
% net = antreneazaRetea(net , Ex.trainVectors,Ex.trainLabels , MP);
% 
% %train 2
% net.divideParam.trainInd = [1:7000 8001:9873];
% net.divideParam.valInd = [7001:8000];
% %net.divideParam.testInd = [7001:8000];
% 
% net = antreneazaRetea(net , Ex.trainVectors,Ex.trainLabels , MP);
% 
% %train 3
% net.divideParam.trainInd = [1:6000 7001:9873];
% net.divideParam.valInd = [6001:7000];
% %net.divideParam.testInd = [6001:7000];
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
%[net eroare] = antreneazaRetea(net , Ex.trainVectors,Ex.trainLabels , MP);


% eroare = 1;
% % while eroare > 0.005
% %     [net eroare] = antreneazaRetea(net , Ex.trainVectors,Ex.trainLabels , MP);
% %        eroare
% % end
% 


%csvwrite('retea2.csv',retea);
%csvwrite('program4.csv',FinalRez);


end

function [net, eroare] = antreneazaRetea(net , MA ,ETICHETE, MP)

[net antrenare] = train(net,MA,MP');

figure
plot(antrenare.epoch, antrenare.perf);
plotperform(antrenare);


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


eroare = sum(EtichetaProf ~=  Rez')/length(Rez)


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

