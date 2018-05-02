function [xs] = met_sub_desc(A, b)

    size_b = size(b);
    n = size_b(1);
    
    xs = zeros(1,n);
    
    xs(n) = b(n) / A(n,n);
    k = n-1;
    
    while k>0
    
        sum = 0;
        
        for j = k+1:n 
        
            sum = sum + A(k,j) .* xs(j);
            
        end
    
        xs(k) = (b(k) - sum) /A(k,k);
        
        k=k-1;
        
    end
    

end