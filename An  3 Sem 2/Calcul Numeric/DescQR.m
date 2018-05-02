function [x, Q, R] = DescQR(A,b)

    n = size(A);
    n = n(1);
    
    R = zeros(n);
    Q = zeros(n);
    
    sum = 0;
    for i = 1:n
    
        sum = sum + A(i,1) .* A(i,1);
        
    end
    R(1,1) = sqrt(sum);
    
    for i = 1 : n
    
        Q(i,1) = A(i,1) ./ R(1,1);
        
    end
    
    for j = 2 : n 
        
        sum = 0 ;
        
        for s = 1:n
        
            sum = sum + Q(s,1) .* A(s,j);
            
        end
        
        R(1,j) = sum;
        
    end
    
    for k = 2:n
    
        sum1 = 0;
        sum2 = 0;
        
        for i = 1:n
            
            sum1 = sum + A(i,k) .* A(i,k);
            
        end
        
        for s = 1:k-1
        
            sum2 = R(s,k) .* R(s,k);
    
        end
        
        R(k,k) = sqrt(sum1 - sum2);
        
        for i = 1:n
        
            sum = 0;
            for s = 1:k-1
            
                sum = sum + Q(i,s) .* R(s,k);
            
            end
            
            Q(i,k) = (A(i,k) - sum) / R(k,k);
                
        end
        
        for j = k+1:n
            
        
            sum = 0;
            
            for s = 1:n
            
                sum = sum + Q(s,k) .* A(s,j);
                
                
            end
            
            R(k,j) = sum;
        
        end
    end
    
    x = met_sub_desc(R, transpose(Q), b);

end