function [ output_args ] = main_final( input_args )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

% X = [0 0 0 0.5 0.5 0.5 1 1;0 0.5 1 0 0.5 1 0 0.5];
% T = [1 1 1 1 -1 -1 -1 -1];
% 
% figure(1), hold on;
% eticheta1 = find(T == 1);
% etichetaMinus1 = find(T == -1);
% plot(X(1, eticheta1), X(2, eticheta1), 'or');
% plot(X(1,etichetaMinus1),X(2,etichetaMinus1),'*b');
% axis([-2 2 -2 2]);
% 
% 
% net = newp([-1 1;-1 1], 1, 'hardlims');
% net.inputWeights{1}.initFcn = 'rands';
% net.biases{1}.initFcn = 'rands';
% net.trainParam.showWindow = false;
% net = init(net);
% net.IW{1,1}
% net.b{1}
% 
% 
% net = train(net, X,T);
% 
% pause(2);
% close 1;

[X,Y,Z] = peaks(100);

surf(X,Y,Z);

end

