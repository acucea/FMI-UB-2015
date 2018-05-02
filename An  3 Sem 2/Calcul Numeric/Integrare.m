function I = Integrare(f,a,b,m,metoda)



switch metoda
    case 1 
    I = 0
    h = (b- a)/(2*m);
    X = linspace(a,b,2*m + 1);
    %ab = zeros(2,m);
    for k = 1:m
    
        x2k_1 = a + (2*k-1-1) * h;
        x2kp1 = a + (2*k+1-1) * h;
        I = I + quad(f,x2k_1, x2kp1);
        
    end
    break
    case 2
    
    I = 0
    h = (b- a)/m;
    X = linspace(a,b,m + 1);
    %ab = zeros(2,m);
    for k = 1:m
    
        xk = a + (k-1) * h;
        xkp1 = a + (k+1-1) * h;
        I = I + quad(f,xk, xkp1);

    end
    break
    case 3
    
    I = 0
    h = (b - a)/(2*m);
    X = linspace(a,b,2*m + 1);
    %ab = zeros(2,m);
    for k = 1:m
    
        x2k_1 = a + (2*k-1-1) * h;
        x2kp1 = a + (2*k+1-1) * h;
        I = I + quad(f,x2k_1, x2kp1);
        
    end
    break
    case 4
    
    I = 0
    h = (b - a)/(2*m);
    X = linspace(a,b,2*m + 1);
    %ab = zeros(2,m);
    for k = 1:m
    
        x2k_1 = a + (2*k-1-1) * h;
        x2kp1 = a + (2*k+1-1) * h;
        I = I + quad(f,x2k_1, x2kp1);
        
    end
    break
    otherwise
        disp('Metoda necunoscuta')
end