function [xs] = met_sub_asc(A, b)

    size_x = size(b)(2);
    
    xs = zeros(size_x,1);
    
    xs(1) = b(1) / A(1,1);
    
    for i = 2:size_x 
    
        sum = 0;
        
        for j = 1 :i-1 
        
        sum = sum + A(i,j) .* xs(j);
            
        end
    
        xs(i) = (b(i) - sum) /A(i,i);
        
    end
    

end