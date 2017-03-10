function [ X, Y ] = genereazaMultimeAntrenare( n, c )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here\
 % x = (b-a) * rand(1,m) + a;
 
 X = (4*c - 0 )* rand(1,n) + 0;
 
 Z = rand(1,n) * 1;
 Y = [1,n];
 
 for i = 1 , n
     
    if Z(i) < ( Z(i) / (Z(i) + c) )
        Y(i) = 1;
    else
        Y(i) = 0;
    end

end

