function [ P ] = gasestePolinomOptim( Z, n )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

    X = Z(:,1);
    U = Z(:,2);
    P = polyfit(X,U,n);

end

