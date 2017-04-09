function [ Z ] = genereazaExemple ( f, m )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    X = rand(m,1);
    er = normrnd(0 , 0.25, m, 1);
    U =  f(X) + er;
    Z = [X U];
    
end

