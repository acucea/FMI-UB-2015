function [ output_args ] = laborator8( input_args )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

IN = [-2 -2 -1 -1 0 0 0 0 1 1 2 2 3 3 3 3 4 4 5 5 ; 2 3 1 4 0 1 2 3 0 1 1 2 -1 0 1 2 -2 1 -1 0];
ET = [-1 -1 -1 -1 -1 -1 -1 -1 1 -1 1 -1 1 1 1 1 1 1 1 1 ];

ETplot = hardlim(ET);

plotpv(IN,ETplot);

one = ones(1,20);
newIN = [one ; IN];

dr = inv(newIN * newIN') * newIN * ET';

plotpc([dr(2), dr(3)], dr(1));


%punctul 3

net = newp(IN, ET,'purelin');
net.trainFcn = 'trainb';
% net.trainFcn = 'trainr';
% net.trainFcn = 'trainc';
net.trainParam.lr = 0.005;
net.trainParam.epochs = 200;
net.inputWeights{1,1}.learnFcn = 'learnwh';
net.biases{1}.learnFcn = 'learnwh';
net = init(net);

net = train(net,IN,ET);
plotpc(net.IW{1,1}, net.b{1});

net.biasConnect = 0;
net = init(net);
net = train(net,IN, ET);
plotpc(net.IW{1,1}, 0);

[X,Y] = meshgrid(linspace(-0.3, 0.3, 20) ,linspace(-0.3, 0.3, 20));
Z = size(X);
for i = 1 :20 
    for j = 1 : 20
        Z(i,j) = 1/2 * sum (ET - (X(i,j) * IN(1,:) + Y(i,j) * IN(2,:)).^2);
        
    end
end

surf(X,Y,Z)
colorbar

%punct 7
saveW = [];

net2 = newp(IN, ET,'purelin');
net2.trainFcn = 'trainb';
net2.trainParam.lr = 0.005;
net2.trainParam.epochs = 1;
net2.biasConnect = 0;
net2.inputWeights{1,1}.learnFcn = 'learnwh';
net2.biases{1}.learnFcn = 'learnwh';
net2 = init(net2);

for  i  = 1: 200
    net2 = train(net2,IN,ET);
    w1 = net2.IW{1,1}(1,1);
    w2 = net2.IW{1,1}(1,2);
     z = 1/2 * sum (ET - (w1 * IN(1,:) + w2 * IN(1,:)).^2);
    saveW = [saveW ; w1 w2 z];
end

figure 
plot3(saveW(1, :), saveW(2,:), saveW(3,:));




end

