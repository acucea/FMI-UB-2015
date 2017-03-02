function [ y ] = prob1(x)
    if x >= 10 
        error('Input must be less than 10');
    end
    if x <= -10
        error('Input must be above 10');
    end
    if x <= 2
        y = 2 .* x + 8;
    elseif x > 2
        y = 3 .* ( x .^ 2);
    end
       

end

