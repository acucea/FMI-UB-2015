function [x, L] = DescCholesky(A,b)
    
    size_b = size(b);
    n = size_b(2);

    L = zeros(n);
    alpha = A(1,1);
    
    if alpha <=0 
        disp("A nu este pozitiv definita")
        return;
    end
    
    L(1,1) = sqrt(A(1,1));
    
    for i=2:n
        L(i,1) = A(i,1)/L(1,1);
    end
    
    for k=2:n
        sum = 0;
        
            for s = 1:k-1
            
                sum = sum + (L(k,s) .^2 );
            
            end 

        alpha = A(k,k) - sum;
        
        if alpha <= 0
            disp("A nu este pozitiv definita")
            return;
        end
        
        L(k,k) = sqrt(alpha);
        
        for i=k+1:n
             sum = 0;
        
            for s = 1:k-1
            
                sum = sum + (L(i,s) .* L(k,s) );
            
            end 
            
            L(i,k) = sum ./ L(k,k);
        end
    end

    y = met_sub_asc(L,b);
    x = met_sub_desc(transpose(L),y);
end