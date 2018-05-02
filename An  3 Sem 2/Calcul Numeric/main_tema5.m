A = [0.2 0.01 0; 0 1 0.04; 0 0.02 1];
a = [1 2 3];
eps = 10 ^ (-5);

A = [4 1 2; 0 3 1; 2 4 8];

[x, k] = MetJacobiDDL(A,a,eps);
disp(x);
disp(k);



disp('---5.3---');

A = [4 2 2;2 10 4;2 4 6]

ps = [10, 20, 50];

maxim = 2 / norm(A, Inf);

show = true;
if show == true

figure()

for i = 1 : 3
   
   x = maxim * rand(ps(i),1);
   y = zeros(ps(i),1);
   
   for j = 1:ps(i)
   
        [~,y(j)] = MetJacobiR(A,a,eps,x(j));
       
   end
   
   if i == 1

    plot(x,y,'.r')
    hold on;
   elseif i == 2
    plot(x,y,'.b')
    hold on;
   elseif i == 3
    plot(x,y,'.g')
    hold on;
   end
   
end

maxim = 2/max(eigs(A));


for i = 1 : 3
   
   x = maxim * rand(ps(i),1);
   y = zeros(ps(i),1);
   
   for i = 1:ps(i)
   
        [~,y(i)] = MetJacobiR(A,a,eps,x(i));
       
   end
   
   if i == 1
   
    plot(x,y,'*r')
    hold on;
   elseif i == 2
    plot(x,y,'*b')
    hold on;
   elseif i == 3
    plot(x,y,'*g')
    hold on;
   end
   
end

end

MetJacobiRO(A,a,eps);

A = [4 2 2; 2 10 4; 2 4 6]

figure();
show2 = true;
if show2 == true

    for i = 1 : 3
       
       x = maxim * rand(ps(i),1);
       y = zeros(ps(i),1);
       
       for j = 1:ps(i)
       
            [~,y(j)] = MetGaussSeidelR(A,a,eps,x(j));
           
       end
       
       if i == 1
        plot(x,y,'.r')
        hold on;
       elseif i == 2
        plot(x,y,'.b')
        hold on;
       elseif i == 3
        plot(x,y,'.g')
        hold on;
       end
       
    end
    
    maxim = 2/max(eigs(A));
    
    
    for i = 1 : 3
       
       x = maxim * rand(ps(i),1);
       y = zeros(ps(i),1);
       
        for j = 1:ps(i)
       
            [~,y(j)] = MetGaussSeidelR(A,a,eps,x(j));
           
        end
        
        if i == 1
            plot(x,y,'*r')
            hold on;
        elseif i == 2
            plot(x,y,'*b')
            hold on;
        elseif i == 3
            plot(x,y,'*g')
            hold on;
        end
       
    end
    
end