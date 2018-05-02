function [x, L, U] = DescLU(A,b)

    n = size(A)(1);
    U = zeros(n);
    L = zeros(n);
    
    for j = 1:n
    
        U(1,j) = A(1,j);
        
    end
    
    
    if U(1,1) == 0
        
        disp("Matricea nu adimite factorizarea LU")
        break
        
    end
    
    for i = 1 : n 
        L(i,1) = A(i,1) ./ U(1,1) ;
    end
    
    for k = 2 : n
    
    
        for j = k : n 
        
        sum = 0;
        
            for s = 1:k-1
            
                sum = sum + (L(k,s) .* U(s,j));
            
            end
            
        U(k,j) = A(k,j) - sum;
        
        end
        
        if U(k,k) == 0 
            
            disp("Matricea nu adimite factorizarea LU")
            break

        end
        
        for i = k : n
            
            sum = 0 ;

            for s = 1:k-1;
            
                sum = sum + (L(i,s) .* U(s,k));
            
            end
            
            L(i,k) = (A(i,k) - sum) / U(k,k);

        end
        
    end
    
    y = met_sub_asc(L, b);
    x = met_sub_desc(U, y);
    
end