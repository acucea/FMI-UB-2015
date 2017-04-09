function [ Eroare ] = calculeazaEroare( Pred , EtchAdv )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    
    Pred
    EtchAdv
    Diferenta = Pred - EtchAdv;
    Eroare = sum(Diferenta)./length(Diferenta);

end

