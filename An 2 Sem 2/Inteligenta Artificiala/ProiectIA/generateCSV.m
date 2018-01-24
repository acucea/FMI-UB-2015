function [ output_args ] = generateCSV( input_args )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[TestData] = load('testData.mat');
[NN] = load('network28.mat');

TestData

TestData.testVectors = TestData.testVectors';
%TestData.testLabels = TestData.testLabels';

%TestData.testVectors = normc(TestData.testVectors);

net = NN.net2

EtichetaRetea = sim(net, TestData.testVectors);
EtichetaRetea = compet(EtichetaRetea);


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
        
￼
        Rez = [Rez ; 5];
    end
    
end

FinalRez = [];
for i = 1:m
    FinalRez = [FinalRez ; [i Rez(i)]];
end

size(FinalRez)


csvwrite('LT3.csv',FinalRez);



end

