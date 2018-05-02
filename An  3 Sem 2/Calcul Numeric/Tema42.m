function Tema42()

A = [1 -3 3; 3 -5 3; 6 -6 4];
Atr = transpose(A);

ANew = Atr * A;

disp('-------------------------')
disp('maximum sqrt')
max(sqrt(eigs(ANew)))
disp('-------------------------')

disp('Numarul de conditionare')

norma = max(sqrt(eigs(ANew)));
normInv =  max(1/sqrt(eigs(ANew)));

k = norma * normInv;
disp(k)

disp('-------------------------')

disp(A)

norm(A,2)
cond(A,2)


disp('-------------------------')


A = [10 7 8 7; 7 5 6 5; 8 6 10 9; 7 5 9 10];
b = [32 ;23 ;33 ;31];

x = inv(A) * b ;
disp(x);

disp('-------------------------')
x = [1;1;1;1];

bgama = [32.1 ;22.9 ;33.1 ;30.9];
Agama = [10 7 8.1 7.2; 7.08 5.04 6 5; 8 5.98 9.89 9; 6.99 4.99 9 9.98];

xgmama = inv(Agama) * bgama
% x + alf x = xgama
% 
%gamax = xgmama - x ;
%tetta = gamax * inv(x);
%disp(tetta)

disp('-------------------------')

cond(A, 1)
cond(A, 2)
cond(A, Inf)






end