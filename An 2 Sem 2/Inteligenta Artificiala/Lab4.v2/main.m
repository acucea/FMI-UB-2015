function [  ] = main ( nrElem , grad )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    f = inline('sin(2*pi*x)','x');
    Z = genereazaExemple(f,nrElem);
    %plot(X,Y,'.r');
    P = gasestePolinomOptim(Z,grad);
    
    Pred = ploteazaGraficPolinom(P,nrElem);
    
    EticheteAdevarate = Z(:,2);
    Pred = reshape(Pred, [], 1 );
    
   % length(EticheteAdevarate);
   % length(Pred);
    
    calculeazaEroare(Pred,EticheteAdevarate)

end

