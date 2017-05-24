function [] = laborator10( )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


% %exemplu
% X = [0 1 0 1; 0 0 1 1]; %input-urile
% t = [0 1 1 0]; % target-urile
% net=newff(minmax(X),[2 1],{'hardlim','hardlim'});%definim reteaua
% net.IW{1,1} = [-1 1; 1 -1]; %matricea de ponderi de pe primul strat
% net.LW{2,1}=[1 1]; % matricea de ponderi de pe al doilea strat
% net.b{1} = [-0.5;- 0.5];
% net.b{2} = -0.5; %bias-urile
% a=sim(net,X)
% isequal(a,t)
% 
% figure (1)
% plotpv(X,t);
% plotpc(net.IW{1,1},net.b{1});
% 
% %exercitiul 1
% %vezi ce dracu are
% X = [0 1 0 1; 0 0 1 1]; %input-urile
% t = [1 0 0 1]; % target-urile
% net=newff(minmax(X),[2 1],{'hardlim','hardlim'});%definim reteaua
% net.IW{1,1} = [1 1; 1 1]; %matricea de ponderi de pe primul strat
% net.LW{2,1}=[1 1]; % matricea de ponderi de pe al doilea strat
% net.b{1} = [ -0.5;  -1.5];
% net.b{2} = -1.5; %bias-urile
% a=sim(net,X)
% isequal(a,t)
% 
% figure (2)
% plotpv(X,t);
% plotpc(net.IW{1,1},net.b{1});

% %exercitiul 2
% 
% noOfPoints = 999;
% MA =  4 * rand(2,noOfPoints) - 2 ;
% ET = ones(1,noOfPoints);
% 
% for i = 1 : noOfPoints
%     
%     if ( (  MA(1,i) - MA(2,i) + 1 > 0 ) && ( 1 - MA(1,i) - MA(2,i) > 0 ) && ( MA(2,i) > 0) ) 
%         ET(1,i) = 1;
%     else
%         ET(1,i) = 0;
%     end
% end
% 
% %MA = [MA ; ET] ; 
% 
% figure(3);
% plotpv(MA, ET); 
% 
% net = newff(minmax(MA),[3 1], {'hardlim','hardlim','hardlim'});
% net.IW{1,1} = [1 -1 ; -1 -1 ; 0 1];
% net.LW{2,1} = [1 1 1];
% net.b{1} = [1 ; 1 ; 1]
% net.b{2} = -3;
% a = sim(net, MA);
% 
% figure
% plotpv(MA,a);


% X = [0 1 0 1; 0 0 1 1]; %input-urile
% t = [0 1 1 0]; % target-urile
% net=newff(minmax(X),[2 1],{'logsig','logsig'});%creare retea
% view(net);%vizualizare retea
% net = train(net,X,t);
% a=sim(net,X)

%eXERCITIU

 noOfPoints = 1000;
 MA =  4 * rand(2,noOfPoints) - 2 ;
 ET = ones(1,noOfPoints);
 
 for i = 1 : noOfPoints
     
     if ( (  MA(1,i) - MA(2,i) + 1 > 0 ) && ( 1 - MA(1,i) - MA(2,i) > 0 ) && ( MA(2,i) > 0) ) 
         ET(1,i) = 1;
     else
         ET(1,i) = 0;
     end
 end
 
 net = newff(minmax(MA),[20 1],{'logsig', 'purelin'});
 net.name = 'Perci';
 %view(net);
 %net = train(net,MA,ET);
 net.trainParam.epochs = 1;
% net.trainFcn = 'trainb';
 net = init(net);
 
 error = 1 ;
 maxEpoc = 1000;
 epoc = 0;
 net

while(error > 0.2 || epoc < maxEpoc)
  
     
    net = train(net, MA,ET);
    epoc = epoc + 1 ;
    error = sum(ET ~= sim(net,MA))/length(ET);
    error
     
end
  
 A = sim(net,MA);
 plotpv(MA,A);


end

