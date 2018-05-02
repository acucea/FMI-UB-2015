function df = MetRichardson(f,x,h,n,teta)


%teta = inline('(f(x + h) -f (x))/h','x','h')
%teta = teta_inline

%% TODO defineste teta

Q = zeros(n);
for i = 1:n
   

    if teta == 1
        
        Q(i,1) = (f(x + (h/2^(i-1) )) - f(x)) / (h/2^(i-1));
        
    elseif teta == 2
    
        Q(i,1) =  (f(x + (h/2^(i-1) )) - 2 * f(x) + f(x - (h/2^(i-1) )))/ (h/2^(i-1))^2;
        
    end
   
    
end

for i = 2:n 
    for j = 2:i
    
        Q(i,j) = Q(i,j-1) + (1 / (2^(j-1)) - 1) .* (Q(i,j-1) - Q(i-1,j-1));
        
    end
end


df = Q(n,n);


end