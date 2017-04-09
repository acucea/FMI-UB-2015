function [ Y ] = ploteazaGraficPolinom( P, nrElemente )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

    % X = linspace(-1,1,101);
    % error here :
     X = 0 : 0.01 : 1;
    Y = polyval(P,X);
    plot(X,Y,'.r');
    
end

