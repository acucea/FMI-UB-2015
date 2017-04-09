function [  ] = main (  )

%laborator 5 IA
%M = genereazaMultimeAntrenare(10);
%net = genereazaPerceptron(M);
%simul = simulareRetea(net , M );

M2 = genereazaNorDePuncte(1000);
net2 = genereazaPerceptron2(M2);
simul2 = simulareRetea(net2, M2);
%plot(M2(1,:), M2(2,:),'.r');

%net3 = genereazaPerceptron3();

%net4 = genereazaPerceptron4();




end

function [C1] = genereazaMultimeAntrenare(m)

 C1 = 2 * rand(3,m) - 1;
 %mean2 = mean(C1);
 %mean3 = mean(mean2)
 

end 

function [net] = genereazaPerceptron(M)

net = newp([-1 1 ; -1 1 ; -1 1], 1 , 'hardlims');
%net.name = 'perceptronel';
net.IW{1} = [0 1 0];
net.b{1} = 0; 


end

function [A] = simulareRetea(net , M)

A = sim( net, M);

end

function [ MatX ] = genereazaNorDePuncte( nrPct)

MatX = 2 * rand (2 , nrPct ) - 1;
MatX = [MatX; zeros(1, nrPct) ];
MatX(3 , :) = MatX(1, :) - MatX(2, :);
MatX(3, :) = hardlim(MatX(3,:));
MatX;

end

function [net] = genereazaPerceptron2(M)
% perceptron punctul B

net = perceptron;
net = configure(net, M([1 2],:) , M(3,:));
%M([1 2], :);


%net = newp(M([1 2],:),M(3,:),'hardlim');
net.IW{1} = [1 0];
%net.IW{1} = [0; 0];
net.b{1} = [0];
%view(net);

end


function [net] = genereazaPerceptron3()

% perceptron pt operatia OR
X = [0 0 1 1;0 1 0 1];
T = [0 1 1 1];
net = perceptron;
net = configure(net, X,T);
%view(net)

%testare retea
X = [0 1 0 1; 0 0 1 1];
Y = net(X);

[X; Y];

end

function [net] = genereazaPerceptron4()
% perceptron pt operatia XOR
X = [0 0 1 1 ; 0 1 0 1];
T = [0 1 1 0];
net = perceptron;
net = train(net, X , T);
%view(net);

%testare reteaX
X = [ 0 1 0 1 ; 0 0 1 1];
Y = net(X);

%[X ; Y ]

end

