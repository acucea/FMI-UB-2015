function [ z ] = prob2( x ,y )

if x == y 
    z = 2;
elseif x - y == 1
    z = -1;
elseif y - x == 1
    z = -1;
else
    z = 0;

end

