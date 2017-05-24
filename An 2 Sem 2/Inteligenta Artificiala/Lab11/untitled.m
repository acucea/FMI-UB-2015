function [ ] = untitled( )
%UNTITLED Summary of this function goes here
%   Detailed explana12tion goes here
clear
X = -1 : 0.005 : 1;
T = sin(2*pi*X) + 0.1 * randn(size(X));

net = newff(minmax(X),[5 1] ,{'tansig','purelin'},'trainlm','learngdm','sse');
net.performFcn = 'sse';
net.trainFcn = 'traingdx';
net.trainParam.epochs = 999;
net.trainParam.goal = 0;
net.trainParam.max_fail = 200;

net.trainFcn = 'trainbr';
net.trainParam.show = 10;
%net.trainParam.time = 10;

net.divideFcn = 'dividerand';
net.divideParam.trainRatio = 0.7;
net.divideParam.valRatio = 0.15;
net.divideParam.testRatio = 0.15;
    
net = init(net);

[net antrenare] = train(net,X,T);

figure(1)
plot(antrenare.epoch, antrenare.perf);

figure(3)
plotperform(antrenare);

figure(2)
plot(X,T,'r') , hold on;
plot(X,sim(net,X),'o');


X = -5 : 0.005 : 5;
T = sin(2*pi*X) + 0.1 * rand(size(X));
figure(4)
plot(X,T,'r') , hold on;
plot(X,sim(net,X),'b');




end

